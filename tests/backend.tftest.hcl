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

  assert {
    error_message = "does not exist"
    condition     = aws_s3_bucket.tf_state.id == "${var.aws_account}-tf-backend"
  }

  assert {
    error_message = "does not exist"
    condition     = aws_s3_bucket.iac_logs.id == "${var.aws_account}-tf-backend-logs"
  }

  assert {
    error_message = "does not exist"
    condition     = aws_dynamodb_table.tf_state_lock.name == "${var.aws_account}-tf-backend-lock-table"
  }
}
