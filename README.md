# Terraform AWS S3 Backend

This Terraform modules is used to make the remote S3 backend for storing state
files. Deploy this ASAP, preferably before deploying any other modules so that
you can capture their state there.

Since this is the module for your backend, to prevent chick-egg or cyclic errors
keep the sate file for this deploying in VCS. This should be O.K. as you should
deploy this once and forget until you MUST destroy. There should be no sensitive
info in the state for this module.

Before you can destroy this module you MUST manually delete all objects in the
S3 bucket. This is on purpose to ensure that objects are not accidentally
deleted.

## Status Badge

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/kohirens/terraform-aws-backend-s3/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/kohirens/terraform-aws-backend-s3/tree/main)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.10 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.82.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_resource_policy.backend_lock_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_resource_policy) | resource |
| [aws_dynamodb_table.backend_lock_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_s3_bucket.backend_storage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.backend_storage_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_lifecycle_configuration.backend_storage_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_logging.backend_storage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_policy.backend_storage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.backend_storage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_public_access_block.backend_storage_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.backend_storage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.backend_storage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_bucket_versioning.backend_storage_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_label"></a> [label](#input\_label) | Optional label to apply to all resources | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to resources | `map(string)` | `{}` | no |
| <a name="input_use_s3_locking"></a> [use\_s3\_locking](#input\_use\_s3\_locking) | Use S3 object locking or set to false to use legacy DynamoDB locking | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backend_storage_resource_policy"></a> [backend\_storage\_resource\_policy](#output\_backend\_storage\_resource\_policy) | n/a |
| <a name="output_logs_bucket"></a> [logs\_bucket](#output\_logs\_bucket) | The name of the bucket that stores terraform logs |
| <a name="output_logs_bucket_arn"></a> [logs\_bucket\_arn](#output\_logs\_bucket\_arn) | The ARN of the bucket that stores terraform logs |
| <a name="output_state_bucket"></a> [state\_bucket](#output\_state\_bucket) | The name of the bucket that stores state files |
| <a name="output_state_bucket_arn"></a> [state\_bucket\_arn](#output\_state\_bucket\_arn) | The ARN of the bucket that stores state files |
| <a name="output_table_arn"></a> [table\_arn](#output\_table\_arn) | DynamoDB table ARN for locking the state file |
| <a name="output_table_name"></a> [table\_name](#output\_table\_name) | DynamoDB table name for locking the state file |
| <a name="output_table_resource_policy"></a> [table\_resource\_policy](#output\_table\_resource\_policy) | n/a |
<!-- END_TF_DOCS -->
