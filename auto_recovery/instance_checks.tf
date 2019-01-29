resource "aws_cloudwatch_metric_alarm" "status_check_failed_instance_alarm_alert" {
  count               = "${local.enable_ar}"
  alarm_name          = "${var.instance_name[count.index]} - StatusCheckFailedInstanceAlarmAlert"
  alarm_description   = "Status checks have failed - alerting only."
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "${var.instance_checks_before_alert}"
  metric_name         = "StatusCheckFailed_Instance"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Minimum"
  threshold           = "0"
  unit                = "Count"
  datapoints_to_alarm = "${var.instance_checks_before_alert > 5 ? 5 : var.instance_checks_before_alert}"

  dimensions {
    InstanceId = "${var.instance_ids[count.index]}"
  }

  ok_actions = [
    "${local.sns_ok_arn}",
  ]

  alarm_actions = [
    "${local.sns_urgent_arn}",
  ]
}

resource "aws_cloudwatch_metric_alarm" "status_check_failed_instance_alarm_reboot" {
  count               = "${local.enable_ar}"
  alarm_name          = "${var.instance_name[count.index]} - StatusCheckFailedInstanceAlarmReboot"
  alarm_description   = "Status checks have failed - rebooting instance"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "${var.instance_checks_before_reboot}"
  metric_name         = "StatusCheckFailed_Instance"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Minimum"
  threshold           = "0"
  unit                = "Count"
  datapoints_to_alarm = "${var.instance_checks_before_reboot > 5 ? 5 : var.instance_checks_before_reboot}"

  dimensions {
    InstanceId = "${var.instance_ids[count.index]}"
  }

  ok_actions = [
    "${local.sns_ok_arn}",
  ]

  alarm_actions = [
    "arn:aws:swf:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:action/actions/AWS_EC2.InstanceId.Reboot/1.0",
    "${local.sns_urgent_arn}",
  ]

  #"arn:aws:swf:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:action/actions/AWS_EC2.InstanceId/Reboot/1.0",
  #"${local.sns_urgent_arn}",
}
