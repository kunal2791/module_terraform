region = "ap-southeast-1"
vpc_id = "vpc-08549eb53e736be91"
public_subnet_ids = ["subnet-082a6625fb70a93d7"]
instance_type= "t2.micro"
ssh_key = "Kunal"
owner = "kunal"
env = "test"
project = "demo"
root_volume_size="8"
jump_sg_description = "To allow ssh"
ssh_access_sg_id = ["sg-027581330760b3393"]
ssh_access_cidr = ["0.0.0.0/0"]
r53_private_id = "Z18RLXA69B9WAO"
is_private_r53 = "1"
