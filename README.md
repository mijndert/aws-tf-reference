# Terraform Reference Architecture for AWS

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> **Warning**:
> This code is provided as-is — it is not meant to be executed verbatim. No support is provided in any way.

## Introduction

TODO: Fill out the introduction where I go over the purpose of this repository and the file structure.

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
cd remote-state
tf init
tf apply
```

## Security groups

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
