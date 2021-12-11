provider "aws" {
  region = "us-east-1"
}

resource "aws_eip" "lb" {
  vpc = true
}

output "ElasticIP" {
  value = aws_eip.lb.public_ip
}

resource "aws_s3_bucket" "mys3" {
  bucket = "jayaws-attribute-demo-001"
}

output "S3BucketARN" {
  value = aws_s3_bucket.mys3.arn
}
