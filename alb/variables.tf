variable "enable_cloudwatch_alarm_actions" {
  default = "true"
  type    = "string"
}

variable "lb_unhealthy_hosts_alarm_evaluation_periods" {
  default = "10"
  type    = "string"
}

variable "lb_unhealthy_hosts_alarm_period" {
  default = "60"
  type    = "string"
}

variable "lb_unhealthy_hosts_alarm_threshold" {
  default = "1"
  type    = "string"
}

variable "r53_healhcheck_type" {
  default = "HTTPS_STR_MATCH"
}

variable "r53_healhcheck_port" {
  default = 443
}

variable "r53_healhcheck_resource_path" {
  default = ""
}

variable "r53_healhcheck_request_interval" {
  default = 30
}

variable "r53_healhcheck_failure_threshold" {
  default = 5
}

variable "r53_healhcheck_stringmatch" {
  default = "Pass"
}

variable "source_cidr_block_r53" {
  type = "list"
}

variable "enable_lb_hc" {
  default = "true"
}

variable "lb_name" {}
variable "lb_arn_suffix" {}
variable "lb_tg_arn_suffix" {}
variable "r53_lb_record_fqdn" {}

variable "r53_healthcheck_path" {
  description = "Path that Healthcheck will check"
  default     = "/docs/sysstatus/var.country/.aspx"
}

variable "sns_topic_ok_name" {
  description = "SNS Topic for OK alarms. Only the name is needed. The rest of the ARN is calculated"
  default     = "test"
}

variable "sns_topic_emergency_name" {
  description = "SNS Topic for Emergency alarms. Only the name is needed. The rest of the ARN is calculated"
  default     = "test"
}
