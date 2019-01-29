// CloudWatch alarm module

resource "aws_cloudwatch_metric_alarm" "cloudwatch_alarm" {
  count               = "${local.enable_cw_metrics * var.instance_count}"
  alarm_name          = "${var.instance_name[count.index]} - ${var.metric_desc}"
  alarm_description   = "${var.metric_desc}"
  comparison_operator = "${var.cpu_comparison_operator}"
  evaluation_periods  = "${var.cpu_evaluation_periods}"
  datapoints_to_alarm = "${var.cpu_datapoints_to_alarm}"
  metric_name         = "${var.cpu_metric_name}"
  namespace           = "${var.cpu_namespace}"
  period              = "${var.cpu_period}"
  statistic           = "${var.cpu_statistic}"
  threshold           = "${var.cpu_threshold}"
  unit                = "${var.cpu_unit}"
  treat_missing_data  = "${var.cpu_treat_missing_data}"

  dimensions {
    InstanceId = "${var.instance_ids[count.index]}"
  }

  actions_enabled = "${local.enable_cw_alarm_cpu}"
  ok_actions      = ["${local.sns_ok_arn}"]
  alarm_actions   = ["${local.sns_urgent_arn}"]
}
