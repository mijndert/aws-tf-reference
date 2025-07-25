# Reference Architecture for AWS

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> **Warning**:
> This code is provided as-is — it is not meant to be executed verbatim. No support is provided in any way.

## Introduction

This repository contains a reference architecture for deploying applications on AWS using OpenTofu and Kubernetes. It provides an example of how to set up a VPC with an EKS cluster and deploying a simple "Hello World" application to the cluster.

The file structure is organized as follows:
- `remote-state/`: Contains the OpenTofu configuration for managing remote state.
- `example-deployment/`: Contains an example deployment of the infrastructure using the OpenTofu modules.
- `kubernetes/`: Contains Kubernetes manifests for deploying a simple "Hello World" application.

## Getting started

### Prerequisites

To get started you first have to install OpenTofu on your machine. Installation instructions for all platforms [can be found here](https://opentofu.org/docs/intro/install/).

You also need to install Taskfile to run the tasks in this repository. Installation instructions can be found [here](https://taskfile.dev/installation/).

It's also good to have `kubectl` installed on your machine to interact with Kubernetes clusters. You can find installation instructions [here](https://kubernetes.io/docs/tasks/tools/).

You also need to have the AWS CLI installed and configured with your AWS credentials. You can find installation instructions [here](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).

### Setting up remote state

Before you can start working with setting up environments using OpenTofu you have to set up everything needed for state management. This is a one time process for each new AWS account.

```bash
cd remote-state
task plan
task apply
```

### Deployment the infrastructure

To deploy the infrastructure, navigate to the `example-deployment` directory and run:

```bash
task plan
task apply
```

## Kubernetes Deployment

In the `kubernetes` directory, you will find the necessary YAML files to deploy a simple "Hello World" application using Kubernetes.

```bash
cd kubernetes
kubectl apply -f hello-world-deployment.yml
```

To clean up the Kubernetes resources, you can run:

```bash
kubectl delete -f hello-world-deployment.yml
```

For more information on this example deployment, refer to the `kubernetes/README.md` file.

## Clean up

To remove the deployed infrastructure, navigate to the `example-deployment` directory and run:

```bash
task destroy
```


