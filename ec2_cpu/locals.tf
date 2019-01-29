locals {
  #### Main
  name_prefix         = "${terraform.workspace}"
  account_id          = "${data.aws_caller_identity.current.account_id}"
  local_region        = "${data.aws_region.current.name}"
  enable_cw_alarm_cpu = "${(var.enable_cw_alarm_cpu  || var.enable_cw_alarm_cpu =="true") ? true : false}"
  enable_cw_metrics   = "${(var.enable_cw_metrics  || var.enable_cw_metrics =="true") ? 1 : 0}"

  sns_topic_arn_prefix = "arn:aws:sns:${local.local_region}:${local.account_id}:${local.name_prefix}"
  sns_ok_arn           = "${local.sns_topic_arn_prefix}-ok"
  sns_default_arn      = "${local.sns_topic_arn_prefix}-default"
  sns_urgent_arn       = "${local.sns_topic_arn_prefix}-urgent"
  sns_emergency_arn    = "${local.sns_topic_arn_prefix}-emergency"
}
