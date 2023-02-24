# Terraform Reference Architecture for AWS

> **Warning**:
> This code is provided as-is — it is not meant to be executed verbatim. No support is provided in any way.

## Introduction

TODO: Add introduction in README.

## Getting started

### Terraform & shell configuration

To get started you first have to install Terraform on your machine. Installation instructions for all platforms [can be found here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).

To make life a little easier you can add this alias in whatever shell configuration you have:

```
alias tf="terraform"
```

### Setting up statefile management

Before you can start working with setting up environments using Terraform you have to set up everything needed for state management. This is a one time process for each new AWS account.

```
cd modules/state
tf init
tf apply
```

Terraform will ask to name the new S3 bucket where the statefile will be stored. Further information can be found in `modules/state/README.md`.

## Security groups

Security Groups are defined within the VPC module because this makes it easier to reference them into each other and tighten security.

Each VPC has a `Name` tag associated which is used in datasources inside of other modules.

```
data "aws_security_group" "this" {
  tags = {
    Name = "..."
  }
}
```

This returns the ID of the security group:

```
security_groups = [ data.aws_security_group.this.id ]
```
