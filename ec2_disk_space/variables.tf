variable "instance_name" {
  description = "EC2 Instance name tag"
  type        = "list"
}

variable "instance_ids" {
  description = "EC2 Instance ID"
  type        = "list"
}

variable "instance_type" {}
variable "instance_count" {}

variable "disk_metric_desc" {
  description = "Metric description, e.g. Low Disk Space - System Disks"
  default     = "Low Disk Space"
}

variable "diskspace_disks" {
  description = "List of disks on the instance"
  type        = "list"
  default     = ["C"]
}

variable "disk_comparison_operator" {
  default = "LessThanThreshold"
}

variable "disk_evaluation_periods" {
  default = "5"
}

variable "disk_datapoints_to_alarm" {
  default = "5"
}

variable "disk_namespace" {
  default = "Windows/Default"
}

variable "disk_period" {
  default = "60"
}

variable "disk_statistic" {
  default = "Average"
}

variable "disk_threshold" {
  default = "25"
}

variable "disk_unit" {
  default = ""
}

variable "disk_metric_name" {
  default = "LogicalDisk % Free Space"
}

variable "disk_treat_missing_data" {
  default = "missing"
}

#variable "os" {}

# variable "enable_cloudwatch_alarm_actions" {
#   default = true
# }

variable "enable_cw_metrics" {
  default = true
}

variable "ami_id" {}

variable "path" {
  type    = "list"
  default = [""]
}

variable "fstype" {
  default = "ext4"
}

variable "enable_cw_alarm_disk_win" {
  default = false
}

variable "enable_cw_alarm_disk_tux" {
  default = false
}
