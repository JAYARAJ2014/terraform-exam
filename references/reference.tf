
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
resource "aws_instance" "jayaws_ec2_001" {
  ami           = "ami-0ed9277fb7eb570c9"
  instance_type = "t3.micro"
  tags = {
    Name = "jayaws_ec2_001"
  }
}

resource "aws_eip" "jay_aws_eip" {
  vpc = true
}


# Associate Elastic IP with the EC2 instance. 
# id of the newly created instance for instance id
# since there can be multiple elastic ips , we want to be sure that we are using the right one
# hence using allocation id 

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.jayaws_ec2_001.id
  allocation_id = aws_eip.jay_aws_eip.id
}
