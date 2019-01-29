variable "r53_region" {
  default = "us-east-1"
}

variable "healthcheck_id" {
  description = "Route53 Healthcheck ID"
}

variable "fqdn" {
  description = "Route53 Healthcheck FQDN"
}

variable "metric_desc" {
  description = "Metric description, e.g. Route53 Healthcheck"
  default     = "Route53 Healthcheck"
}

variable "alarm_action" {
  description = "Alarm action description e.g. Route53 Healthcheck"
  default     = "Route53 Healthcheck"
}

variable "comparison_operator" {
  default = "LessThanThreshold"
}

variable "evaluation_periods" {
  default = "10"
}

variable "datapoints_to_alarm" {
  default = "10"
}

variable "namespace" {
  default = "AWS/Route53"
}

variable "period" {
  default = "60"
}

variable "statistic" {
  default = "Minimum"
}

variable "threshold" {
  default = "1"
}

variable "unit" {
  default = ""
}

variable "metric_name" {
  default = "HealthCheckStatus"
}

variable "treat_missing_data" {
  default = "breaching"
}

variable "sns_topic" {
  default = "rackspace-support-emergency"
}
