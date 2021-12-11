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
  region = "us-east-1"
}

resource "aws_instance" "jayaws_ec2" {
  ami           = "ami-0ed9277fb7eb570c9"
  instance_type = "t3.micro"
  count         = 3
}

# resource "aws_eip" "name" {

# }
