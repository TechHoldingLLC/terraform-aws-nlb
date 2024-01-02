###############
# nlb/data.tf #
###############

## This data source block filters out the ENI list, which has "ELB" prefix. This will only work if the var.create_nlb is true
data "aws_network_interfaces" "nlb" {
  count = var.create_nlb ? 1 : 0
  filter {
    name = "description"
    values = [
      "ELB ${aws_lb.nlb[count.index].arn_suffix}"
    ]
  }
}

## This data source block returns a list of NLB IPs. This will only work if the var.create_nlb is true
data "aws_network_interface" "nlb" {
  count = var.create_nlb ? length(var.subnets) : 0
  id    = element(flatten(data.aws_network_interfaces.nlb[*].ids), count.index)
}