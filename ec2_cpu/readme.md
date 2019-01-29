## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu_comparison_operator |  | string | `GreaterThanOrEqualToThreshold` | no |
| cpu_datapoints_to_alarm |  | string | `12` | no |
| cpu_evaluation_periods |  | string | `12` | no |
| cpu_metric_name |  | string | `CPUUtilization` | no |
| cpu_namespace |  | string | `AWS/EC2` | no |
| cpu_period |  | string | `300` | no |
| cpu_statistic |  | string | `Average` | no |
| cpu_threshold |  | string | `70` | no |
| cpu_treat_missing_data |  | string | `missing` | no |
| cpu_unit |  | string | `` | no |
| enable_cw_alarm_cpu |  | string | `true` | no |
| enable_cw_metrics |  | string | `true` | no |
| instance_count |  | string | - | yes |
| instance_ids | EC2 Instance ID | list | - | yes |
| instance_name | EC2 Instance name tag | list | - | yes |
| metric_desc | Metric description, e.g. EC2 CPU Utilization | string | `EC2 CPU Utilization` | no |

