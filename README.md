## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.5 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lb.nlb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_network_interface.nlb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/network_interface) | data source |
| [aws_network_interfaces.nlb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/network_interfaces) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_logs"></a> [access\_logs](#input\_access\_logs) | An Access Logs block | <pre>list(object({<br>    bucket  = string<br>    prefix  = string<br>    enabled = bool<br>  }))</pre> | `[]` | no |
| <a name="input_create_nlb"></a> [create\_nlb](#input\_create\_nlb) | Create NLB | `bool` | `false` | no |
| <a name="input_create_nlb_listener"></a> [create\_nlb\_listener](#input\_create\_nlb\_listener) | Create NLB Listener | `bool` | `false` | no |
| <a name="input_deregistration_delay"></a> [deregistration\_delay](#input\_deregistration\_delay) | Amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused. | `number` | `60` | no |
| <a name="input_enable_cross_zone_load_balancing"></a> [enable\_cross\_zone\_load\_balancing](#input\_enable\_cross\_zone\_load\_balancing) | If true, cross-zone load balancing of the load balancer will be enabled. | `bool` | `true` | no |
| <a name="input_enable_deletion_protection"></a> [enable\_deletion\_protection](#input\_enable\_deletion\_protection) | If true, deletion of the load balancer will be disabled via the AWS API. | `bool` | `true` | no |
| <a name="input_enforce_security_group_inbound_rules_on_private_link_traffic"></a> [enforce\_security\_group\_inbound\_rules\_on\_private\_link\_traffic](#input\_enforce\_security\_group\_inbound\_rules\_on\_private\_link\_traffic) | If on, then inbound security group rules are enforced for traffic originating from a PrivateLink, o/w set it off | `string` | `"on"` | no |
| <a name="input_health_check"></a> [health\_check](#input\_health\_check) | Listener Rule Health Check | `map(string)` | `{}` | no |
| <a name="input_internal"></a> [internal](#input\_internal) | If true, the LB will be internal | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the LB | `string` | `""` | no |
| <a name="input_nlb_arn"></a> [nlb\_arn](#input\_nlb\_arn) | NLB arn | `string` | `""` | no |
| <a name="input_port"></a> [port](#input\_port) | Listener port | `number` | `80` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | Protocol for Listener & Target Group | `string` | `"TCP"` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | NLB security group id | `list(string)` | `[]` | no |
| <a name="input_subnet_mapping"></a> [subnet\_mapping](#input\_subnet\_mapping) | A list of subnet IDs to attach to the LB | <pre>list(object({<br>    allocation_id        = string # The allocation ID of the Elastic IP address for an internet-facing load balancer.<br>    ipv6_address         = string # An ipv6 address within the subnet to assign to the internet-facing load balancer.<br>    private_ipv4_address = string # A private ipv4 address within the subnet to assign to the internal-facing load balancer.<br>    subnet_id            = string # The id of the subnet of which to attach to the load balancer. You can specify only one subnet per Availability Zone.<br>  }))</pre> | `[]` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Subnets to host NLB | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_target_group_name"></a> [target\_group\_name](#input\_target\_group\_name) | Target group name | `string` | `""` | no |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | Type of target that you must specify when registering targets with this target group | `string` | `"ip"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC id | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_arn_suffix"></a> [arn\_suffix](#output\_arn\_suffix) | n/a |
| <a name="output_dns"></a> [dns](#output\_dns) | n/a |
| <a name="output_ips"></a> [ips](#output\_ips) | n/a |
| <a name="output_port"></a> [port](#output\_port) | n/a |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | n/a |
| <a name="output_target_group_arn"></a> [target\_group\_arn](#output\_target\_group\_arn) | n/a |
| <a name="output_target_group_arn_suffix"></a> [target\_group\_arn\_suffix](#output\_target\_group\_arn\_suffix) | n/a |

## License

Apache 2 Licensed. See [LICENSE](https://github.com/TechHoldingLLC/terraform-aws-nlb/blob/main/LICENSE) for full details.