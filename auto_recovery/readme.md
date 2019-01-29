## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| autorecovery_enabled |  | string | `true` | no |
| instance_checks_before_alert |  | string | `10` | no |
| instance_checks_before_reboot |  | string | `5` | no |
| instance_count |  | string | `0` | no |
| instance_ids | EC2 Instance ID | list | - | yes |
| instance_name | EC2 Instance name tag | list | - | yes |
| system_checks_before_alert |  | string | `5` | no |
| system_checks_before_recover |  | string | `2` | no |