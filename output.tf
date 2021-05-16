output "backend_id" {
  description = "The name of the bucket."
  value       = aws_s3_bucket.backend.id
}

output "backend_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = aws_s3_bucket.backend.arn
}

output "backend_bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = aws_s3_bucket.backend.bucket_domain_name
}

output "backend_bucket_regional_domain_name" {
  description = "The bucket region-specific domain name. The bucket domain name including the region name, please refer here for format. Note: The AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL."
  value       = aws_s3_bucket.backend.bucket_regional_domain_name
}

output "backend_hosted_zone_id" {
  description = "The Route 53 Hosted Zone ID for this bucket's region."
  value       = aws_s3_bucket.backend.hosted_zone_id
}

output "backend_region" {
  description = "The AWS region this bucket resides in."
  value       = aws_s3_bucket.backend.region
}

output "backend_website_endpoint" {
  description = "The website endpoint, if the bucket is configured with a website. If not, this will be an empty string."
  value       = aws_s3_bucket.backend.website_endpoint
}

output "backend_website_domain" {
  description = "The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records. "
  value       = aws_s3_bucket.backend.website_domain
}


output "backend_logs_id" {
  description = "The name of the bucket."
  value       = aws_s3_bucket.backend_logs.id
}

output "backend_logs_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = aws_s3_bucket.backend_logs.arn
}

output "backend_logs_bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = aws_s3_bucket.backend_logs.bucket_domain_name
}

output "backend_logs_bucket_regional_domain_name" {
  description = "The bucket region-specific domain name. The bucket domain name including the region name, please refer here for format. Note: The AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL."
  value       = aws_s3_bucket.backend_logs.bucket_regional_domain_name
}

output "backend_logs_hosted_zone_id" {
  description = "The Route 53 Hosted Zone ID for this bucket's region."
  value       = aws_s3_bucket.backend_logs.hosted_zone_id
}

output "backend_logs_region" {
  description = "The AWS region this bucket resides in."
  value       = aws_s3_bucket.backend_logs.region
}

output "backend_logs_website_endpoint" {
  description = "The website endpoint, if the bucket is configured with a website. If not, this will be an empty string."
  value       = aws_s3_bucket.backend_logs.website_endpoint
}

output "backend_logs_website_domain" {
  description = "The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records. "
  value       = aws_s3_bucket.backend_logs.website_domain
}

output "backend_table_arn" {
  description = "DynamoDB table ARN"
  value       = aws_dynamodb_table.backend_table.arn
}

output "backend_table_id" {
  description = "DynamoDB table ID"
  value       = aws_dynamodb_table.backend_table.id
}

output "backend_table_name" {
  description = "DynamoDB table name"
  value       = aws_dynamodb_table.backend_table.name
}
