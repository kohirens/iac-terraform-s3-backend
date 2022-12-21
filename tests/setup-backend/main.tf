terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aws = {
      source  = "hashicorp/aws"
      version = ">=3.40.0, <5.0.0"
    }
  }
}

locals {
  aws_region          = "us-west-1"
  aws_account         = 755285156183
  environment         = "qa"
  expected_state_name = "${local.environment}-${local.aws_account}-tf-backend"
  expected_logs_name  = "${local.expected_state_name}-logs"
  expected_table_name = "${local.expected_state_name}-lock-table"
}

provider "aws" {
  region = local.aws_region
}

module "main" {
  source            = "../.."
  access_log_prefix = "terraform-test-tf/"
  aws_account       = local.aws_account
  aws_region        = local.aws_region
  environment       = local.environment
}

data "aws_s3_bucket" "state" {
  depends_on = [
    module.main
  ]
  bucket = module.main.state_bucket_name
}

data "aws_s3_bucket" "logs" {
  depends_on = [
    module.main
  ]
  bucket = module.main.logs_bucket_name
}

data "aws_dynamodb_table" "lookup" {
  depends_on = [
    module.main
  ]
  name = module.main.table_name
}

resource "test_assertions" "verify_setup" {
  component = "verify_setup"

  equal "verify_state_bucket" {
    description = "exist"
    got         = data.aws_s3_bucket.state.bucket
    want        = local.expected_state_name
  }

  equal "verify_log_bucket" {
    description = "exist"
    got         = data.aws_s3_bucket.logs.bucket
    want        = local.expected_logs_name
  }

  equal "verify_table_bucket" {
    description = "exist"
    got         = data.aws_dynamodb_table.lookup.name
    want        = local.expected_table_name
  }
}
