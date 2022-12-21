locals {
  shared_name = "${var.environment}-${var.aws_account}-tf-backend"
}

resource "aws_s3_bucket" "backend_logs" {
  bucket        = "${local.shared_name}-logs"
  force_destroy = var.force_destroy
}

resource "aws_s3_bucket_acl" "backend_logs_acl" {
  bucket = aws_s3_bucket.backend_logs.bucket
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket_versioning" "backend_logs_versioning" {
  bucket = aws_s3_bucket.backend_logs.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "backend_logs_lifecycle" {
  bucket = aws_s3_bucket.backend_logs.bucket
  rule {
    id     = "${local.shared_name}-logs-rule"
    status = "Enabled"

    filter {
      and {
        prefix = var.access_log_prefix
        tags = {
          rule      = "${local.shared_name}-logs-rule"
          autoclean = "true"
        }
      }
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
  bucket        = local.shared_name
  force_destroy = false
}

resource "aws_s3_bucket_acl" "backend_acl" {
  bucket = aws_s3_bucket.backend.bucket
  acl    = "private"
}

resource "aws_s3_bucket_logging" "backend_logging" {
  bucket        = aws_s3_bucket.backend.bucket
  target_bucket = aws_s3_bucket.backend_logs.bucket
  target_prefix = var.access_log_prefix
}

resource "aws_s3_bucket_server_side_encryption_configuration" "backend_sse" {
  bucket = aws_s3_bucket.backend.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
    bucket_key_enabled = true
  }
}

resource "aws_s3_bucket_versioning" "backend_versioning" {
  bucket = aws_s3_bucket.backend.bucket
  versioning_configuration {
    status = "Enabled"
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
  name         = "${local.shared_name}-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
