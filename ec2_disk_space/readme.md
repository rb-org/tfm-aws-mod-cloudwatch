## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ami_id |  | string | - | yes |
| disk_comparison_operator |  | string | `LessThanThreshold` | no |
| disk_datapoints_to_alarm |  | string | `5` | no |
| disk_evaluation_periods |  | string | `5` | no |
| disk_metric_desc | Metric description, e.g. Low Disk Space - System Disks | string | `Low Disk Space` | no |
| disk_metric_name |  | string | `LogicalDisk % Free Space` | no |
| disk_namespace |  | string | `Windows/Default` | no |
| disk_period |  | string | `60` | no |
| disk_statistic |  | string | `Average` | no |
| disk_threshold |  | string | `25` | no |
| disk_treat_missing_data |  | string | `missing` | no |
| disk_unit |  | string | `` | no |
| diskspace_disks | List of disks on the instance | list | `<list>` | no |
| enable_cw_alarm_disk_tux |  | string | `false` | no |
| enable_cw_alarm_disk_win |  | string | `false` | no |
| enable_cw_metrics |  | string | `true` | no |
| fstype |  | string | `ext4` | no |
| instance_count |  | string | - | yes |
| instance_ids | EC2 Instance ID | list | - | yes |
| instance_name | EC2 Instance name tag | list | - | yes |
| instance_type |  | string | - | yes |
| path |  | list | `<list>` | no |