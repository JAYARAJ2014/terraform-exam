terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# terraform reads the data from aws_ami and exports it as example
data "aws_ami" "example" {
  most_recent = true

  owners = ["amazon"]
  tags = {
    Name   = "app-server"
    Tested = "true"
  }
}

locals {
  common_tags = {
    Owner           = "DevOps"
    Service         = "Backend"
    CreatedDateTime = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  }
}
variable "is-prod" {
  default = false
  type    = bool
}

resource "aws_instance" "dev" {
  ami           = data.aws_ami.example.id #"ami-0ed9277fb7eb570c9"
  instance_type = "t3.micro"
  tags          = local.common_tags
  count         = var.is-prod == true ? 0 : 1
}
resource "aws_instance" "prod" {
  ami           = "ami-0ed9277fb7eb570c9"
  instance_type = "t2.micro"
  tags          = local.common_tags
  count         = var.is-prod == true ? 3 : 0
}
