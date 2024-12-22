moved {
  from = aws_s3_bucket_policy.tf-state
  to   = aws_s3_bucket_policy.backend_storage
}

moved {
  from = aws_s3_bucket.iac_logs
  to   = aws_s3_bucket.backend_storage_logs
}

moved {
  from = aws_s3_bucket_versioning.iac_logs
  to   = aws_s3_bucket_versioning.backend_storage_logs
}

moved {
  from = aws_s3_bucket_lifecycle_configuration.iac_logs
  to   = aws_s3_bucket_lifecycle_configuration.backend_storage_logs
}

moved {
  from = aws_s3_bucket_public_access_block.iac_logs
  to   = aws_s3_bucket_public_access_block.backend_storage_logs
}

moved {
  from = aws_s3_bucket.tf_state
  to   = aws_s3_bucket.backend_storage
}

moved {
  from = aws_s3_bucket_logging.tf_state
  to   = aws_s3_bucket_logging.backend_storage
}

moved {
  from = aws_s3_bucket_server_side_encryption_configuration.tf_state
  to   = aws_s3_bucket_server_side_encryption_configuration.backend_storage
}

moved {
  from = aws_s3_bucket_versioning.tf_state
  to   = aws_s3_bucket_versioning.backend_storage
}

moved {
  from = aws_s3_bucket_public_access_block.tf_state
  to   = aws_s3_bucket_public_access_block.backend_storage
}

moved {
  from = aws_dynamodb_table.tf_state_lock
  to   = aws_dynamodb_table.backend_lock_table
}
