provider "aws" {
  region = "us-east-1"
}

run "setup" {
  module {
    source = "./tests/setup"
  }
}

run "deploy_backend" {
  command = apply

  variables {
    label          = "test-dynamodb"
    use_s3_locking = false
  }

  assert {
    error_message = "does not exist"
    condition     = aws_s3_bucket.backend_storage.id == "${var.label}-${run.setup.account_id}-terraform-backend"
  }

  assert {
    error_message = "does not exist"
    condition     = aws_s3_bucket.backend_storage_logs.id == "${var.label}-${run.setup.account_id}-terraform-backend-logs"
  }

  assert {
    error_message = "does not exist"
    condition     = aws_dynamodb_table.backend_lock_table[0].name == "${var.label}-${run.setup.account_id}-terraform-backend-lock-table"
  }
}
