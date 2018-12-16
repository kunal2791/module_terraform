resource "aws_iam_instance_profile" "jumpfordemo" {
  name  = "jump"
  role = "${aws_iam_role.jumpfordemo.name}"
}

##This resouce will create IAM role
resource "aws_iam_role" "jumpfordemo" {
  name = "${var.env}_jump"
  path = "/"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

##This resouce will atatch IAM inline policy to IAM role
resource "aws_iam_role_policy" "jump_policy" {
  name = "${var.env}_jump"
  role = "${aws_iam_role.jumpfordemo.id}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "autoscaling:Describe*",
                "cloudwatch:*",
                "logs:*",
                "s3:*",
                "sns:*"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "iam:CreateServiceLinkedRole",
            "Resource": "arn:aws:iam::*:role/aws-service-role/events.amazonaws.com/AWSServiceRoleForCloudWatchEvents*",
            "Condition": {
                "StringLike": {
                    "iam:AWSServiceName": "events.amazonaws.com"
                }
            }
        }
    ]
}
EOF
}
