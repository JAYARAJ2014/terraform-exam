# Terraform

## Configuration Management

Ansible, Chef, Puppet = Configuration Mangement. Install / Manage software on servers that already exists. Not primarily designed for infrastructure provisioning.

## Infrastructure Orchestration

Terraform, Cloud Formation = Infrastructure Orchestration tool. Provisioning infrastructure possible

## Terraform +points

- Terraform supports multiple platforms (AWS, GCP etc)
- Terraform also support many other tools (like k8s)
- Faster learning curve
- Easy integration with Configuration Management tools
- Easily exetnsible with plugins
- Free!!!

### Before beginning..

What cloud provider you want to target ?

```
    provider "aws" {
    region     = "us-east-1"
    access_key = ""
    secret_key = ""
}
```

How to authenticate to cloud provider ?

- static credentials (See above)
- environment variables

Which region the reosurce needs to be launched ? (See above)
Which resource to be launched ?

```
    #example
    resource "aws_instance" "jayaws_ec2_001" {
  ami           = "ami-0ed9277fb7eb570c9"
  instance_type = "t3.micro"
}
```

Once you declare a provider then you need to initialize. This will download the plugins
If you navigate to the .terraform\ to see the provider binaries downloaded.

Run `terraform init`

If you are initializing aws and create an ec2 instance you will get folder like this
`.terraform/providers/registry.terraform.io/hashicorp/aws/3.68.0/linux_amd64/`

Run `Terraform plan`

Run `terraform apply`

To target a specific type of resource
Example Run `terraform -target aws_instance.jayaws_ec2_001`

NOTE: If a you remove a section (Such as a resource) from a .tf file , the next time the configuration is applied, terraform will remove the resource.

## Terraform State File

Very important. Dont mess with state file
How terraform knows the delta ? => State File
State file stores teh infrastructure state in state file
State file contains information about the resources that are currently live

Desired State = Terraform configuration (.TF) file

COnfigurations that are not part of the desired state will not refelct in Terraform plan.
Recommendation: Whenever you create a resource, specifiy all important aspects like secuirty group IAM role etc.

Current State = Actual state of the resource that is currently deployed.

`terraform refresh` refreshes the statefile to represent the current state.

## Provider Versioning

Provider plugins are maintained and released seperately from terraform. Version numbers are different.

```
=3.8  Production recommended.
~> 2.0  Any version above specified
>= 1.0 greater than equal to
<= 2.0 less than equal to specified version
>= 2.10 , <=2.30  specifying range of provider version

```

if a lock file (Dependancy Lock file) is present (This should be version controlled) version change will not be allowed. To override this behvior.

`terraform init -upgrade`

## Attributes

terraform can output the attribute of a resource it created using output values.
An output can act as input for another resource

## Variables

terraform.tfvars to specify variable values
variables.tf to declare variables

or use environment var as in example `setx TF_VAR_instance_type t2.micro`

data types

- string
- list => array
- map => key value pair
- number
- boolean
- any

Referring value from a list.

use list[index]

Referring value from a map
use map[key]

## Count Parameter

Scale resources by incrementing number. specify count in the resource block

## Count Index

`count.index` --- to access an item from a list of resources

## Conditional

`condition ? trueval: falseval`

## Locals

Helps to avoid repeating same value / expression at multiple times.

you can declare locals like this

```
locals {
  common_tags = {
    Owner   = "DevOps"
    Service = "Backend"
  }
}
```

and refer it like `local.tags` at multiple places.

It can include conditional expressions and functions.

## Functions

Terraform functions umeric, string, collection, file system encoding etc.

Use `terraform console` to experiment functions.

## Data Source

Data sources allow Terraform to use information defined outside of Terraform, defined by another separate Terraform configuration, or modified by functions.

```
data "aws_ami" "example" {
  most_recent = true

  owners = ["self"]
  tags = {
    Name   = "app-server"
    Tested = "true"
  }
}

```

## Logging

export TF_LOG_PATH=./tf.log

`export TF_LOG=TRACE ` Most verbose
Other options such as INFO DEBUG WARN ERROR

## Validation

`terraform validate`
