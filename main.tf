locals {
  sharedName = "${var.environment}-${var.aws_account}-tf-backend"
}

resource "aws_s3_bucket" "backend_logs" {
  acl           = "log-delivery-write"
  bucket        = "${local.sharedName}-logs"
  force_destroy = false

  versioning {
    enabled = false
  }
  lifecycle_rule {
    id      = "${local.sharedName}-logs-rule"
    enabled = true

    prefix = var.access_log_prefix

    tags = {
      rule      = "${local.sharedName}-logs-rule"
      autoclean = "true"
    }

    transition {
      days          = 45
      storage_class = "STANDARD_IA" # or "ONEZONE_IA"
    }

    transition {
      days          = 90
      storage_class = "GLACIER"
    }

    expiration {
      days = 183
    }
  }
}

resource "aws_s3_bucket_public_access_block" "backend_logs_exclude_public" {
  bucket                  = aws_s3_bucket.backend_logs.bucket
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket" "backend" {
  acl           = "private"
  bucket        = local.sharedName
  force_destroy = false

  logging {
    target_bucket = aws_s3_bucket.backend_logs.bucket
    target_prefix = var.access_log_prefix
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
      bucket_key_enabled = true
    }
  }

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "backend_bucket_exclude_public" {
  bucket                  = aws_s3_bucket.backend.bucket
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "backend_table" {
  name         = "${local.sharedName}-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
