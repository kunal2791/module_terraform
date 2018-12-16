output "sg_id" {
  value = "${aws_security_group.sg_jump.id}"
}
output "aws_instance" {
  value = "${aws_instance.jump.id}"
}
