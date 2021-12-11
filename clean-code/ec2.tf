resource "aws_instance" "jayaws_ec2" {
  ami           = "ami-0ed9277fb7eb570c9"
  instance_type = var.instance_type
  count         = 3
}
