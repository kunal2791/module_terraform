resource "aws_s3_bucket" "kjopsterraform" {
  bucket = "kjopsterraformbucket"
  acl    = "private"

  tags {
    Name        = "${var.owner}"
    Environment = "${var.env}"
  }
}
