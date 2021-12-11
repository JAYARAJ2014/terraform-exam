resource "aws_iam_user" "user1" {
  name = "user1"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}
