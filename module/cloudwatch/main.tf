resource "aws_cloudwatch_metric_alarm" "jump" {
  alarm_name                = "${var.owner}-${var.env}-jump_CpuUtilization"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "3"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "${var.env}-jump-CPUUtilization"
  #alarm_actions = [
  #  "${var.sns_topic}"]
  dimensions = {
  InstanceId = "${var.aws_instance}"
  }
}

resource "aws_cloudwatch_metric_alarm" "jump-memory" {
  alarm_name                = "${var.owner}-${var.env}-jump_MemoryUtilization"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "3"
  metric_name               = "MemoryUtilization"
  namespace                 = "System/Linux"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "${var.env}-jump-MemoryUtilization"
#  alarm_actions = [
#    "${var.sns_topic}"]
  dimensions = {
  InstanceId = "${var.aws_instance}"
  }
}

resource "aws_cloudwatch_metric_alarm" "jump-disk" {
  alarm_name                = "${var.owner}-${var.env}-jump_DiskSpaceUtilization"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "3"
  metric_name               = "DiskSpaceUtilization"
  namespace                 = "System/Linux"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "${var.env}-jump-DiskSpaceUtilization"
  #alarm_actions = [
  #  "${var.sns_topic}"]
  dimensions = {
  Filesystem = "/dev/xvda1"
  MountPath = "/"
  InstanceId = "${var.aws_instance}"
  }
}
