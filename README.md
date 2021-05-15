# Hugo Admin IaC

This is the IaC (written in Terraform) used to make the remote S3 backend
for the Terraform state files. 

You can make the resources using the TerraGrunt `backend_init` process, but it
does not give you any way to destroy those resources when they are no longer
needed.

NOTE: The TerraGrunt `backend_init` should be disabled the first time this
      Terraform is applied.

## Resources

The following resources will be made.

* An S3 bucket for storing access logs (with a prefix).
* An S3 bucket for storing terraform state.
* A DynamoDB table for state locking and consistency checking.
