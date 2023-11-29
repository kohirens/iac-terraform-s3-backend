provider "aws" {
  region = "us-east-1"
}

variables {
  aws_region = "us-west-1"
}

run "execute" {
  variables {
    access_log_prefix = "terraform-test-tf/"
    aws_region        = "us-west-1"
  }
}

run "verify_resources" {
  module {
    source = "./tests/01-backend"
  }

  variables {
    state_bucket = run.execute.state_bucket_id
    log_bucket   = run.execute.logs_bucket_name
    table_name   = run.execute.table_name
  }

  assert {
    error_message = "does not exist"
    condition     = data.aws_s3_bucket.state.bucket == "${var.aws_account}-tf-backend"
  }

  assert {
    error_message = "does not exist"
    condition     = data.aws_s3_bucket.logs.bucket == "${var.aws_account}-tf-backend-logs"
  }

  assert {
    error_message = "does not exist"
    condition     = data.aws_dynamodb_table.lookup.name == "${var.aws_account}-tf-backend-lock-table"
  }
}
