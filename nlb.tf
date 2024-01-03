##############
# nlb/nlb.tf #
##############

#-------------To Create Network Load Balancer-------------#
resource "aws_lb" "nlb" {
  count                                                        = var.create_nlb ? 1 : 0
  name                                                         = var.name
  internal                                                     = var.internal
  load_balancer_type                                           = "network"
  enable_cross_zone_load_balancing                             = var.enable_cross_zone_load_balancing
  subnets                                                      = var.subnets
  security_groups                                              = var.security_group_ids
  enable_deletion_protection                                   = var.enable_deletion_protection
  enforce_security_group_inbound_rules_on_private_link_traffic = var.enforce_security_group_inbound_rules_on_private_link_traffic
  tags = merge(
    {
      "Name" = var.name
    },
    var.tags
  )

  dynamic "subnet_mapping" {
    for_each = var.subnet_mapping

    content {
      allocation_id        = lookup(subnet_mapping.value, "allocation_id", null)
      ipv6_address         = lookup(subnet_mapping.value, "ipv6_address", null)
      private_ipv4_address = lookup(subnet_mapping.value, "private_ipv4_address", null)
      subnet_id            = subnet_mapping.value.subnet_id
    }
  }

  dynamic "access_logs" {
    for_each = var.access_logs
    content {
      bucket  = lookup(access_logs.value, "bucket", null)
      prefix  = lookup(access_logs.value, "prefix", null)
      enabled = lookup(access_logs.value, "true", null)
    }
  }
}