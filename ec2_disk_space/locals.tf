locals {
  #### Main
  name_prefix                     = "${terraform.workspace}"
  account_id                      = "${data.aws_caller_identity.current.account_id}"
  local_region                    = "${data.aws_region.current.name}"
  cloudwatch_alarm_disk_win_count = "${(var.enable_cw_alarm_disk_win == "true" || var.enable_cw_alarm_disk_win) && var.enable_cw_metrics ? var.instance_count * local.disk_count : 0 }"
  cloudwatch_alarm_disk_tux_count = "${(var.enable_cw_alarm_disk_tux == "true" || var.enable_cw_alarm_disk_tux) && var.enable_cw_metrics ? var.instance_count * local.disk_count : 0 }"
  sns_topic_arn_prefix            = "arn:aws:sns:${local.local_region}:${local.account_id}:${local.name_prefix}"
  sns_ok_arn                      = "${local.sns_topic_arn_prefix}-ok"
  sns_default_arn                 = "${local.sns_topic_arn_prefix}-default"
  sns_urgent_arn                  = "${local.sns_topic_arn_prefix}-urgent"
  sns_emergency_arn               = "${local.sns_topic_arn_prefix}-emergency"
  disk_count                      = "${length(var.diskspace_disks)}"
}
