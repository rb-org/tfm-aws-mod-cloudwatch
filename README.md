# Terraform - AWS - Module - Cloudwatch

## Build Status

[![CircleCI](https://circleci.com/gh/rb-org/tfm-aws-mod-cloudwatch/tree/master.svg?style=svg&circle-token=2b8306711620df59902b72cd444fda10ed06cbf9)](https://circleci.com/gh/rb-org/tfm-aws-mod-cloudwatch/tree/master)

## ALB 

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| lb\_arn\_suffix |  | string | n/a | yes |
| lb\_name |  | string | n/a | yes |
| lb\_tg\_arn\_suffix |  | string | n/a | yes |
| r53\_lb\_record\_fqdn |  | string | n/a | yes |
| source\_cidr\_block\_r53 |  | list | n/a | yes |
| enable\_cloudwatch\_alarm\_actions |  | string | `"true"` | no |
| enable\_lb\_hc |  | string | `"true"` | no |
| lb\_unhealthy\_hosts\_alarm\_evaluation\_periods |  | string | `"10"` | no |
| lb\_unhealthy\_hosts\_alarm\_period |  | string | `"60"` | no |
| lb\_unhealthy\_hosts\_alarm\_threshold |  | string | `"1"` | no |
| r53\_healhcheck\_failure\_threshold |  | string | `"5"` | no |
| r53\_healhcheck\_port |  | string | `"443"` | no |
| r53\_healhcheck\_request\_interval |  | string | `"30"` | no |
| r53\_healhcheck\_resource\_path |  | string | `""` | no |
| r53\_healhcheck\_stringmatch |  | string | `"Pass"` | no |
| r53\_healhcheck\_type |  | string | `"HTTPS_STR_MATCH"` | no |
| r53\_healthcheck\_path | Path that Healthcheck will check | string | `"/docs/sysstatus/var.country/.aspx"` | no |
| sns\_topic\_emergency\_name | SNS Topic for Emergency alarms. Only the name is needed. The rest of the ARN is calculated | string | `"test"` | no |
| sns\_topic\_ok\_name | SNS Topic for OK alarms. Only the name is needed. The rest of the ARN is calculated | string | `"test"` | no |

## EC2_CPU

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| instance\_count |  | string | n/a | yes |
| instance\_ids | EC2 Instance ID | list | n/a | yes |
| instance\_name | EC2 Instance name tag | list | n/a | yes |
| cpu\_comparison\_operator |  | string | `"GreaterThanOrEqualToThreshold"` | no |
| cpu\_datapoints\_to\_alarm |  | string | `"12"` | no |
| cpu\_evaluation\_periods |  | string | `"12"` | no |
| cpu\_metric\_name |  | string | `"CPUUtilization"` | no |
| cpu\_namespace |  | string | `"AWS/EC2"` | no |
| cpu\_period |  | string | `"300"` | no |
| cpu\_statistic |  | string | `"Average"` | no |
| cpu\_threshold |  | string | `"70"` | no |
| cpu\_treat\_missing\_data |  | string | `"missing"` | no |
| cpu\_unit |  | string | `""` | no |
| enable\_cw\_alarm\_cpu |  | string | `"true"` | no |
| enable\_cw\_metrics |  | string | `"true"` | no |
| metric\_desc | Metric description, e.g. EC2 CPU Utilization | string | `"EC2 CPU Utilization"` | no |

## EC2_DISK

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ami\_id |  | string | n/a | yes |
| instance\_count |  | string | n/a | yes |
| instance\_ids | EC2 Instance ID | list | n/a | yes |
| instance\_name | EC2 Instance name tag | list | n/a | yes |
| instance\_type |  | string | n/a | yes |
| disk\_comparison\_operator |  | string | `"LessThanThreshold"` | no |
| disk\_datapoints\_to\_alarm |  | string | `"5"` | no |
| disk\_evaluation\_periods |  | string | `"5"` | no |
| disk\_metric\_desc | Metric description, e.g. Low Disk Space - System Disks | string | `"Low Disk Space"` | no |
| disk\_metric\_name |  | string | `"LogicalDisk % Free Space"` | no |
| disk\_namespace |  | string | `"Windows/Default"` | no |
| disk\_period |  | string | `"60"` | no |
| disk\_statistic |  | string | `"Average"` | no |
| disk\_threshold |  | string | `"25"` | no |
| disk\_treat\_missing\_data |  | string | `"missing"` | no |
| disk\_unit |  | string | `""` | no |
| diskspace\_disks | List of disks on the instance | list | `<list>` | no |
| enable\_cw\_alarm\_disk\_tux |  | string | `"false"` | no |
| enable\_cw\_alarm\_disk\_win |  | string | `"false"` | no |
| enable\_cw\_metrics |  | string | `"true"` | no |
| fstype |  | string | `"ext4"` | no |
| path |  | list | `<list>` | no |

## Route53

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| fqdn | Route53 Healthcheck FQDN | string | n/a | yes |
| healthcheck\_id | Route53 Healthcheck ID | string | n/a | yes |
| alarm\_action | Alarm action description e.g. Route53 Healthcheck | string | `"Route53 Healthcheck"` | no |
| comparison\_operator |  | string | `"LessThanThreshold"` | no |
| datapoints\_to\_alarm |  | string | `"10"` | no |
| evaluation\_periods |  | string | `"10"` | no |
| metric\_desc | Metric description, e.g. Route53 Healthcheck | string | `"Route53 Healthcheck"` | no |
| metric\_name |  | string | `"HealthCheckStatus"` | no |
| namespace |  | string | `"AWS/Route53"` | no |
| period |  | string | `"60"` | no |
| r53\_region |  | string | `"us-east-1"` | no |
| sns\_topic |  | string | `"rackspace-support-emergency"` | no |
| statistic |  | string | `"Minimum"` | no |
| threshold |  | string | `"1"` | no |
| treat\_missing\_data |  | string | `"breaching"` | no |
| unit |  | string | `""` | no |