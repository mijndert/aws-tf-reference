# State module

This module is needed to, initially, create an S3 bucket and DynamoDB table for state management.

The module will ask for the region you want to deploy this module to (default: eu-west-1) and the name of the S3 bucket, which needs to be unique as S3 is a global namespace.

## Update configuration

If you ever want to change anything to the configuration of the resources created by this module, you'll have to import said resources first. This is because we don't have a statefile stored for this deployment.

You'll only run this the first time you're setting up a new environment in `./environments/`. 
The following steps need to be taken (replacing `terraform-state-accountid-region` with the actual `var.bucket_name` value):

```
tf init
tf import aws_dynamodb_table.terraform_locks terraform-locks
tf import aws_s3_bucket.terraform_state terraform-state-accountid-region
tf import aws_s3_bucket_ownership_controls.terraform_state terraform-state-accountid-region
tf import aws_s3_bucket_policy.terraform_state terraform-state-accountid-region
tf import aws_s3_bucket_public_access_block.terraform_state terraform-state-accountid-region
tf import aws_s3_bucket_server_side_encryption_configuration.terraform_state terraform-state-accountid-region
tf import aws_s3_bucket_versioning.terraform_state terraform-state-accountid-region
tf plan
tf apply
rm terraform.tfstate terraform.tfstate.backup
```
