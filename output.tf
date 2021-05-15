output "iac_bucket_id" {
  description = "The name of the bucket."
  value       = aws_s3_bucket.iac_bucket.id
}

output "iac_bucket_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = aws_s3_bucket.iac_bucket.arn
}

output "iac_bucket_bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = aws_s3_bucket.iac_bucket.bucket_domain_name
}

output "iac_bucket_bucket_regional_domain_name" {
  description = "The bucket region-specific domain name. The bucket domain name including the region name, please refer here for format. Note: The AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL."
  value       = aws_s3_bucket.iac_bucket.bucket_regional_domain_name
}

output "iac_bucket_hosted_zone_id" {
  description = "The Route 53 Hosted Zone ID for this bucket's region."
  value       = aws_s3_bucket.iac_bucket.hosted_zone_id
}

output "iac_bucket_region" {
  description = "The AWS region this bucket resides in."
  value       = aws_s3_bucket.iac_bucket.region
}

output "iac_bucket_website_endpoint" {
  description = "The website endpoint, if the bucket is configured with a website. If not, this will be an empty string."
  value       = aws_s3_bucket.iac_bucket.website_endpoint
}

output "iac_bucket_website_domain" {
  description = "The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records. "
  value       = aws_s3_bucket.iac_bucket.website_domain
}


output "iac_logs_id" {
  description = "The name of the bucket."
  value       = aws_s3_bucket.iac_logs.id
}

output "iac_logs_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = aws_s3_bucket.iac_logs.arn
}

output "iac_logs_bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = aws_s3_bucket.iac_logs.bucket_domain_name
}

output "iac_logs_bucket_regional_domain_name" {
  description = "The bucket region-specific domain name. The bucket domain name including the region name, please refer here for format. Note: The AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL."
  value       = aws_s3_bucket.iac_logs.bucket_regional_domain_name
}

output "iac_logs_hosted_zone_id" {
  description = "The Route 53 Hosted Zone ID for this bucket's region."
  value       = aws_s3_bucket.iac_logs.hosted_zone_id
}

output "iac_logs_region" {
  description = "The AWS region this bucket resides in."
  value       = aws_s3_bucket.iac_logs.region
}

output "iac_logs_website_endpoint" {
  description = "The website endpoint, if the bucket is configured with a website. If not, this will be an empty string."
  value       = aws_s3_bucket.iac_logs.website_endpoint
}

output "iac_logs_website_domain" {
  description = "The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records. "
  value       = aws_s3_bucket.iac_logs.website_domain
}

output "iac_table_arn" {
  description = "DynamoDB table ARN"
  value       = aws_dynamodb_table.iac_table.arn
}

output "iac_table_id" {
  description = "DynamoDB table ID"
  value       = aws_dynamodb_table.iac_table.id
}

output "iac_table_name" {
  description = "DynamoDB table name"
  value       = aws_dynamodb_table.iac_table.name
}
