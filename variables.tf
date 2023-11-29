variable "access_log_prefix" {
  description = "Prefix used for Access logs in the access log bucket."
  type        = string
}

variable "aws_account" {
  description = "AWS account ID."
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "force_destroy" {
  description = "force bucket destruction"
  type        = bool
  default     = false
}
