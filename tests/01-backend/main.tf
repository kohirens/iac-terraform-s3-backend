terraform {
  required_providers {
  }
}

locals {
  aws_region = "us-west-1"
}

provider "aws" {
  region = local.aws_region
}

variable "state_bucket" {
  type = string
}

variable "log_bucket" {
  type = string
}

variable "table_name" {
  type = string
}

data "aws_s3_bucket" "state" {
  bucket = var.state_bucket
}

data "aws_s3_bucket" "logs" {
  bucket = var.log_bucket
}

data "aws_dynamodb_table" "lookup" {
  name = var.table_name
}
