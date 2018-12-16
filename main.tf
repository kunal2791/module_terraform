provider "aws" {
#  access_key = "${var.access_key}"
#  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}


module "instance" {
   source = "./module/instance"
   region = "${var.region}"
   env = "${var.env}"
   owner = "${var.owner}"
   ami = "${var.ami}"
   project = "${var.project}"
   ssh_key = "${var.ssh_key}"
   public_subnet_ids = ["${element(var.public_subnet_ids,1)}"]
   vpc_id = "${var.vpc_id}"
   r53_private_id  = "${var.r53_private_id}"
   is_private_r53 = "${var.is_private_r53}"
   ssh_access_cidr = "${var.ssh_access_cidr}"
   instance_type = "${var.instance_type}"
   root_volume_size = "${var.root_volume_size}"
   jump_sg_description = "${var.jump_sg_description}"
   ssh_access_sg_id = "${var.ssh_access_sg_id}"
   ssh_access_cidr = "${var.ssh_access_cidr}"
   aws_iam = "${module.iam.aws_iam}"
}

module "iam" {
   source = "./module/iam"
   #region = "${var.region}"
   env = "${var.env}"
   owner = "${var.owner}"
   #ami = "${var.ami}"
   project = "${var.project}"
}

module "storage" {
   source = "./module/storage"
   #region = "${var.region}"
   env = "${var.env}"
   owner = "${var.owner}"
   #ami = "${var.ami}"
   #project = "${var.project}"
}

module "cloudwatch" {
   source = "./module/cloudwatch"
   #region = "${var.region}"
   env = "${var.env}"
   owner = "${var.owner}"
   aws_instance = "${module.instance.aws_instance}"
   #vpc = "${var.vpc_id}"
   #project = "${var.project}"
}
