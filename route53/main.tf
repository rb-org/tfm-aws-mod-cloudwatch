// CloudWatch alarm module for route53 healthcheck
data "aws_caller_identity" "current" {}

resource "aws_cloudwatch_metric_alarm" "cloudwatch_alarm" {
  alarm_name          = "${var.metric_desc} - ${var.fqdn}"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods  = "${var.evaluation_periods}"
  datapoints_to_alarm = "${var.datapoints_to_alarm}"
  metric_name         = "HealthCheckStatus"
  namespace           = "AWS/Route53"
  period              = "${var.period}"
  statistic           = "${var.statistic}"
  threshold           = "${var.threshold}"
  unit                = "None"
  treat_missing_data  = "${var.treat_missing_data}"
  alarm_description   = "${var.alarm_action} - ${var.fqdn}"
  provider            = "aws.virginia"

  dimensions {
    HealthCheckId = "${var.healthcheck_id}"
  }

  alarm_actions = ["arn:aws:sns:${var.r53_region}:${data.aws_caller_identity.current.account_id}:${var.sns_topic}"]
}
