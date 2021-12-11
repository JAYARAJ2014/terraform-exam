/*
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


resource "aws_iam_user" "jay_aws" {
  name = var.emp_num
  path = "/system/"

  tags = {
    tag-key = "created by jayaraj"
  }
}
*/
