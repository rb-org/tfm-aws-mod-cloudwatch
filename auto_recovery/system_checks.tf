resource "aws_cloudwatch_metric_alarm" "status_check_failed_system_alarm_alert" {
  count               = "${local.enable_ar}"
  alarm_name          = "${var.instance_name[count.index]} - StatusCheckFailedSystemAlarmAlert"
  alarm_description   = "Status checks have failed - alerting only."
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "${var.system_checks_before_alert}"
  metric_name         = "StatusCheckFailed_System"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Minimum"
  threshold           = "0"
  unit                = "Count"
  datapoints_to_alarm = "${var.system_checks_before_alert > 5 ? 5 : var.system_checks_before_alert}"

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

resource "aws_cloudwatch_metric_alarm" "status_check_failed_system_alarm_recover" {
  count               = "${local.enable_ar}"
  alarm_name          = "${var.instance_name[count.index]} - StatusCheckFailedSystemAlarmRecover"
  alarm_description   = "Status checks have failed for system, recovering instance"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "${var.system_checks_before_recover}"
  metric_name         = "StatusCheckFailed_System"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Minimum"
  threshold           = "0"
  unit                = "Count"
  datapoints_to_alarm = "${var.system_checks_before_recover > 5 ? 5 : var.system_checks_before_recover}"

  dimensions {
    InstanceId = "${var.instance_ids[count.index]}"
  }

  alarm_actions = [
    "arn:aws:automate:${data.aws_region.current.name}:ec2:recover",
    "${local.sns_emergency_arn}",
  ]

  ok_actions = [
    "${local.sns_ok_arn}",
  ]
}
