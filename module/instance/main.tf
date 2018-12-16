provider "aws" {
#  access_key = "${var.access_key}"
#  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}
resource "aws_instance" "jump" {
  ami = "${lookup(var.ami, var.region)}"
  instance_type = "${var.instance_type}"
  subnet_id = "${element(var.public_subnet_ids,1)}"
  key_name = "${var.ssh_key}"
 iam_instance_profile = "${var.aws_iam}"
  #monitoring = "true"
  vpc_security_group_ids = [
    "${aws_security_group.sg_jump.id}"]
   user_data = "${data.template_file.init.rendered}"
  root_block_device {
    volume_type = "gp2"
    volume_size = "${var.root_volume_size}"
    delete_on_termination = "true"
  }

  tags {
    Name = "${var.project}-${var.env}-jump"
    Environment = "${lower(var.env)}"
    Owner = "${var.owner}"
    Project = "${var.project}"
  }
  volume_tags {
    Name = "${var.project}-${var.env}-jump-root"
    Environment = "${lower(var.env)}"
    Owner = "${var.owner}"
    Project = "${var.project}"
  }

}
data "template_file" "init" {
  template = "${file("${path.module}/init.tpl")}"

  vars {
    HOSTNAME = "${var.project}-${var.env}-jump"
    ENV = "${var.env}"
  }
}
resource "aws_security_group" "sg_jump" {
  name = "${var.project}-${var.env}-jump"
  vpc_id = "${var.vpc_id}"
  description = "${var.jump_sg_description}"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = "${var.ssh_access_cidr}"
  }
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    security_groups = "${var.ssh_access_sg_id}"
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
  tags {
    Name = "${var.project}-${var.env}-jump"
    Environment = "${lower(var.env)}"
    Owner = "${var.owner}"
    Project = "${var.project}"
  }
}

resource "aws_route53_record" "r53-private" {
  count = "${var.is_private_r53 ? 1 : 0}"
  zone_id = "${var.r53_private_id}"
  name = "${var.project}-${var.env}-jump"
  type = "A"
  ttl = "300"
  records = [
    "${aws_instance.jump.private_ip}"]
}
