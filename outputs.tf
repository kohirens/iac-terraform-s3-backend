output "state_bucket_arn" {
  description = "The ARN of the bucket that stores state files"
  value       = aws_s3_bucket.backend_storage.arn
}
output "state_bucket" {
  description = "The name of the bucket that stores state files"
  value       = aws_s3_bucket.backend_storage.bucket
}

output "backend_storage_resource_policy" {
  value = aws_s3_bucket_policy.backend_storage.policy
}

output "logs_bucket_arn" {
  description = "The ARN of the bucket that stores terraform logs"
  value       = aws_s3_bucket.backend_storage_logs.arn
}

output "logs_bucket" {
  description = "The name of the bucket that stores terraform logs"
  value       = aws_s3_bucket.backend_storage_logs.bucket
}

output "table_arn" {
  description = "DynamoDB table ARN for locking the state file"
  value       = local.dynamodb_count > 0 ? aws_dynamodb_table.backend_lock_table[0].arn : ""
}

output "table_name" {
  description = "DynamoDB table name for locking the state file"
  value       = local.dynamodb_count > 0 ? aws_dynamodb_table.backend_lock_table[0].name : ""
}

output "table_resource_policy" {
  value = local.dynamodb_count > 0 ? aws_dynamodb_resource_policy.backend_lock_table[0].policy : ""
}
