variable "instance_name" {
  description = "EC2 Instance name tag"
  type        = "list"
}

variable "instance_ids" {
  description = "EC2 Instance ID"
  type        = "list"
}

variable "instance_count" {}

variable "metric_desc" {
  description = "Metric description, e.g. EC2 CPU Utilization"
  default     = "EC2 CPU Utilization"
}

variable "cpu_comparison_operator" {
  default = "GreaterThanOrEqualToThreshold"
}

variable "cpu_evaluation_periods" {
  default = "12"
}

variable "cpu_datapoints_to_alarm" {
  default = "12"
}

variable "cpu_namespace" {
  default = "AWS/EC2"
}

variable "cpu_period" {
  default = "300"
}

variable "cpu_statistic" {
  default = "Average"
}

variable "cpu_threshold" {
  default = "70"
}

variable "cpu_unit" {
  default = ""
}

variable "cpu_metric_name" {
  default = "CPUUtilization"
}

variable "cpu_treat_missing_data" {
  default = "missing"
}

variable "enable_cw_alarm_cpu" {
  default = true
}

variable "enable_cw_metrics" {
  default = true
}
