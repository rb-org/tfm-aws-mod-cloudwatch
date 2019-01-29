#Cloudwatch Alarms for Prod ALB

resource "aws_cloudwatch_metric_alarm" "lb_unhealthy_hosts" {
  count = "${var.enable_lb_hc == "True" ? 1 : 0}"

  actions_enabled = "${var.enable_cloudwatch_alarm_actions}"

  alarm_actions = [
    "arn:aws:sns:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${var.sns_topic_emergency_name}",
  ]

  alarm_description   = "Unhealthy Host count is above threshold, creating ticket."
  alarm_name          = "ALB Unhealthy Host Count - ${var.lb_name}"
  comparison_operator = "GreaterThanThreshold"

  dimensions = {
    LoadBalancer = "${var.lb_arn_suffix}"
    TargetGroup  = "${var.lb_tg_arn_suffix}"
  }

  evaluation_periods = "${var.lb_unhealthy_hosts_alarm_evaluation_periods}"
  metric_name        = "UnHealthyHostCount"
  namespace          = "AWS/ApplicationELB"

  ok_actions = [
    "arn:aws:sns:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${var.sns_topic_ok_name}",
  ]

  period    = "${var.lb_unhealthy_hosts_alarm_period}"
  statistic = "Average"
  threshold = "${var.lb_unhealthy_hosts_alarm_threshold}"
  unit      = "Count"
}

resource "aws_route53_health_check" "alb_r53_healthcheck" {
  count             = "${var.enable_lb_hc == "True" ? 1 : 0}"
  fqdn              = "${var.r53_lb_record_fqdn}"
  type              = "${var.r53_healhcheck_type}"              # can be HTTP, HTTPS, TCP. Use HTTP_STR_MATCH or HTTPS_STR_MATCH when combined with search_string
  port              = "${var.r53_healhcheck_port}"
  resource_path     = "${var.r53_healthcheck_path}"
  failure_threshold = "${var.r53_healhcheck_failure_threshold}"
  request_interval  = "${var.r53_healhcheck_request_interval}"

  search_string = "${var.r53_healhcheck_stringmatch}"

  tags {
    Name = "${var.lb_name}-healthcheck"
  }
}

resource "aws_cloudwatch_metric_alarm" "lb_r53_healthcheck" {
  count    = "${var.enable_lb_hc == "True" ? 1 : 0}"
  provider = "aws.cloudwatch"

  actions_enabled = "${var.enable_cloudwatch_alarm_actions}"

  alarm_actions = [
    "arn:aws:sns:eu-west-1:${data.aws_caller_identity.current.account_id}:${var.sns_topic_emergency_name}",
  ]

  alarm_name        = "${element(aws_route53_health_check.alb_r53_healthcheck.*.tags.Name, count.index)}"
  alarm_description = "R53 healthcheck has become unhealthy for ${var.lb_name}"

  statistic           = "Minimum"
  comparison_operator = "LessThanThreshold"
  threshold           = "1"
  evaluation_periods  = "10"
  period              = "60"
  metric_name         = "HealthCheckStatus"
  namespace           = "AWS/Route53"

  dimensions = {
    HealthCheckId = "${element(aws_route53_health_check.alb_r53_healthcheck.*.id, count.index)}"
  }

  ok_actions = [
    "arn:aws:sns:eu-west-1:${data.aws_caller_identity.current.account_id}:${var.sns_topic_emergency_name}",
  ]
}
