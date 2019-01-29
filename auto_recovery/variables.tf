variable "instance_name" {
  description = "EC2 Instance name tag"
  type        = "list"
}

variable "instance_ids" {
  description = "EC2 Instance ID"
  type        = "list"
}

variable "instance_count" {
  default = 0
}

variable "autorecovery_enabled" {
  default = "true"
}

variable "instance_checks_before_alert" {
  default = 10
}

variable "instance_checks_before_reboot" {
  default = 5
}

variable "system_checks_before_alert" {
  default = 5
}

variable "system_checks_before_recover" {
  default = 2
}

##########

