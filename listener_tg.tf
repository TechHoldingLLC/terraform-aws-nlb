######################
# nlb/listener_tg.tf #
######################

locals {
  nlb_arn = var.create_nlb ? aws_lb.nlb[0].arn : var.nlb_arn # If NLB is created using this module, then NLB arn value is directly assigned from newly created NLB, otherwise the arn value is passed using the variable.
}

#--------To Create NLB listener--------#
resource "aws_lb_listener" "listener" {
  count             = var.create_nlb_listener ? 1 : 0
  load_balancer_arn = local.nlb_arn
  port              = var.port
  protocol          = var.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group[0].arn
  }
}

#--------------To Create NLB Target Group--------------#
## Target Group is needed for forward action of listener
resource "aws_lb_target_group" "target_group" {
  count                = var.create_nlb_listener ? 1 : 0
  name                 = var.target_group_name
  port                 = var.port
  protocol             = var.protocol
  target_type          = var.target_type
  deregistration_delay = var.deregistration_delay
  vpc_id               = var.vpc_id

  dynamic "health_check" {
    for_each = [var.health_check]
    content {
      enabled             = lookup(health_check.value, "enabled", null)
      interval            = lookup(health_check.value, "interval", null)
      path                = var.protocol == "TCP" ? null : lookup(health_check.value, "path")
      timeout             = lookup(health_check.value, "timeout", null)
      healthy_threshold   = lookup(health_check.value, "healthy_threshold", null)
      unhealthy_threshold = lookup(health_check.value, "unhealthy_threshold", null)
      port                = lookup(health_check.value, "port", null)
      protocol            = lookup(health_check.value, "protocol", null)
      matcher             = var.protocol == "TCP" ? null : lookup(health_check.value, "matcher")
    }
  }
}
