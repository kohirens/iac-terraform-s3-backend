# aws-tf-s3

A Terraform used to make the remote S3 backend for storing Terraform state
files (think chicken-egg paradigm).

If you already use TerraGrunt, these are the same resources using `backend_init`
process would yield, however it does not give you a state file to tear it down
when it is no longer needed.

You can use this module to make those resources and just store the state file
in a VCS repository.

You can also store it in the s3 bucket itself, creating a chicken-egg paradigm.
By simply changing the remote backend to the very S3 bucket this makes, then run
a new TerraGrunt plan. You will also have to switch it back when you want to
tear down the backend infrastructure.

## Status Badge

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/kohirens/aws-tf-s3-backend/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/kohirens/aws-tf-s3-backend/tree/main)

## Resources

The following resources will be made.

* An S3 bucket for storing access logs (with a prefix).
* An S3 bucket for storing terraform state.
* A DynamoDB table for state locking and consistency checking.
