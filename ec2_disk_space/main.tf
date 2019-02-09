resource "aws_cloudwatch_metric_alarm" "cloudwatch_alarm_win" {
  count = "${local.cloudwatch_alarm_disk_win_count}"

  alarm_name        = "${element(var.instance_name, (count.index ) / length(var.diskspace_disks))} - ${element(var.diskspace_disks, ((count.index ) / length(var.diskspace_disks)))} - ${var.disk_metric_desc}"
  alarm_description = "${var.disk_metric_desc}"

  comparison_operator = "${var.disk_comparison_operator}"
  evaluation_periods  = "${var.disk_evaluation_periods}"
  datapoints_to_alarm = "${var.disk_datapoints_to_alarm}"
  metric_name         = "${var.disk_metric_name}"
  namespace           = "${var.disk_namespace}"
  period              = "${var.disk_period}"
  statistic           = "${var.disk_statistic}"
  threshold           = "${var.disk_threshold}"
  unit                = "${var.disk_unit}"
  treat_missing_data  = "${var.disk_treat_missing_data}"

  dimensions {
    InstanceId   = "${element(var.instance_ids, (count.index ) / length(var.diskspace_disks))}"
    instance     = "${element(var.diskspace_disks, ((count.index) / length(var.diskspace_disks)))}:"
    objectname   = "LogicalDisk"
    ImageId      = "${element(var.ami_id, (count.index ) / length(var.diskspace_disks))}"
    InstanceType = "${var.instance_type}"
  }

  actions_enabled = "${var.enable_cw_alarm_disk_win}"
  ok_actions      = ["${local.sns_ok_arn}"]
  alarm_actions   = ["${local.sns_urgent_arn}"]
}

resource "aws_cloudwatch_metric_alarm" "cloudwatch_alarm_tux" {
  count = "${local.cloudwatch_alarm_disk_tux_count}"

  alarm_name          = "${var.instance_name[(count.index)  / length(var.diskspace_disks)]} - ${var.diskspace_disks [(count.index)  % length(var.diskspace_disks)]} - ${var.disk_metric_desc}"
  alarm_description   = "${var.disk_metric_desc}"
  comparison_operator = "${var.disk_comparison_operator}"
  evaluation_periods  = "${var.disk_evaluation_periods}"
  datapoints_to_alarm = "${var.disk_datapoints_to_alarm}"
  metric_name         = "${var.disk_metric_name}"
  namespace           = "${var.disk_namespace}"
  period              = "${var.disk_period}"
  statistic           = "${var.disk_statistic}"
  threshold           = "${var.disk_threshold}"
  unit                = "${var.disk_unit}"
  treat_missing_data  = "${var.disk_treat_missing_data}"

  dimensions {
    InstanceId   = "${var.instance_ids[count.index / length(var.diskspace_disks)]}"
    path         = "${var.path[count.index % length(var.diskspace_disks)]}"
    device       = "${var.diskspace_disks[count.index % length(var.diskspace_disks)]}"
    ImageId      = "${element(var.ami_id, (count.index ) / length(var.diskspace_disks))}"
    InstanceType = "${var.instance_type}"
    fstype       = "${var.fstype}"
  }

  actions_enabled = "${var.enable_cw_alarm_disk_tux}"
  ok_actions      = ["${local.sns_ok_arn}"]
  alarm_actions   = ["${local.sns_urgent_arn}"]
}
