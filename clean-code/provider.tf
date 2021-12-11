# this was not mandatory but recommended. (May become mandatory in future). 
# But mostly used for providers not maintained by hashicorp

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
  region = var.default_region
}
