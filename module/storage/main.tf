resource "aws_s3_bucket" "kjopsterraform" {
  bucket = "test-bucket"
  acl    = "private"

  tags {
    Name        = "${var.owner}"
    Environment = "${var.env}"
  }
}
