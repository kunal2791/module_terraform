output "sg_id" {
  value = "${module.instance.sg_id}"
}
output "aws_instance_jump" {
  value = "${module.instance.aws_instance}"
}
output "aws_iam_instance_profile" {
  value = "${module.iam.aws_iam}"
}
output "aws_s3" {
  value = "${module.storage.aws_s3}"
}
