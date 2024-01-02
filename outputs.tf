##################
# nlb/outputs.tf #
##################

## All the below listed outputs returns value only when var.create_nlb is true, otherwise they return an empty string ("")

output "arn" {
  value = var.create_nlb ? aws_lb.nlb[0].arn : ""
}

output "arn_suffix" {
  value = var.create_nlb ? aws_lb.nlb[0].arn_suffix : ""
}

output "ips" {
  value = sort(formatlist("%s/32", data.aws_network_interface.nlb.*.private_ip))
}

output "dns" {
  value = var.create_nlb ? aws_lb.nlb[0].dns_name : ""
}

## All the below listed outputs returns value only when var.create_nlb_listener is true, otherwise they return an empty string ("")

output "port" {
  value = var.create_nlb_listener ? aws_lb_listener.listener[0].port : ""
}

output "target_group_arn" {
  value = var.create_nlb_listener ? aws_lb_target_group.target_group[0].arn : ""
}

output "target_group_arn_suffix" {
  value = var.create_nlb_listener ? aws_lb_target_group.target_group[0].arn_suffix : ""
}

output "subnets" {
  value = var.create_nlb ? aws_lb.nlb[0].subnets : []
}