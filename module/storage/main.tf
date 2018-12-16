resource "aws_s3_bucket" "kjopsdemo" {
  bucket = "test-bucket"
  acl    = "private"

  tags {
    Name        = "${var.owner}"
    Environment = "${var.env}"
  }
}
