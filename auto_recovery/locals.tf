locals {
  name_prefix          = "${terraform.workspace}"
  enable_ar            = "${var.autorecovery_enabled == "true" || var.autorecovery_enabled  ? var.instance_count : 0}"
  account_id           = "${data.aws_caller_identity.current.account_id}"
  local_region         = "${data.aws_region.current.name}"
  sns_topic_arn_prefix = "arn:aws:sns:${local.local_region}:${local.account_id}:${local.name_prefix}"
  sns_ok_arn           = "${local.sns_topic_arn_prefix}-ok"
  sns_default_arn      = "${local.sns_topic_arn_prefix}-default"
  sns_urgent_arn       = "${local.sns_topic_arn_prefix}-urgent"
  sns_emergency_arn    = "${local.sns_topic_arn_prefix}-emergency"
  instance_ids         = "${compact(var.instance_ids)}"
}
