resource "aws_s3_bucket" "kjopsterraform" {
  bucket = "kjops-terraform_bucket"
  acl    = "private"

  tags {
    Name        = "${var.owner}"
    Environment = "${var.env}"
  }
}
