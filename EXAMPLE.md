# NLB
Below is an examples of calling this module.

## Create an NLB
### If you want to create NLB only, pass below inputs according to your requirements.
```
module "nlb" {
  create_nlb                 = true    
  source                     = "./nlb"
  name                       = "my-nlb"
  subnets                    = module.subnet_nlb.private_subnet_ids
  security_group_ids         = [module.security_group_nlb.id]       
  internal                   = true             # Give false value if you want to make it public.
  enable_deletion_protection = true
  providers  = {
    aws = aws
  }
}
```

## Create a NLB Listener and Target Group
### If you want to create NLB Listener and Target Group only, pass below inputs according to your requirements.
```
module "nlb_listener_tg" {      
  create_nlb_listener  = true     
  source               = "./nlb"
  nlb_arn              = module.nlb.arn
  target_group_name    = "my-nlb_listener-tg"
  port                 = 80
  deregistration_delay = 60
  vpc_id               = module.vpc.id
  health_check = {
    interval            = 30
    path                = "/"
    timeout             = 20
    healthy_threshold   = 2
    unhealthy_threshold = 2
    port                = 80
    protocol            = "HTTP"          # Here, If you want to use TCP protocol, then don't pass path and matcher attributes
    enabled             = true
    matcher             = 200
  }
  providers = {
    aws = aws
  }
}
```

## Create NLB with its Listener and Target Group
### If you want to create NLB with its Listener and Target Group, pass below inputs according to your requirements.
```
module "nlb" {
  source             = "./nlb"

  # NLB
  create_nlb                 = true
  name                       = "my-nlb"
  subnets                    = module.subnet_nlb.private_subnet_ids
  security_group_ids         = [module.security_group_nlb.id]
  internal                   = true             # Give false value if you want to make it public.
  enable_deletion_protection = true             

  # NLB Listener & Target Group
  create_nlb_listener        = true
  target_group_name          = "my-nlb_listener-tg"
  port                       = var.port
  deregistration_delay       = 60
  vpc_id                     = module.vpc.id
  health_check = {
    interval            = 30
    timeout             = 20       
    healthy_threshold   = 2
    unhealthy_threshold = 2
    port                = 80
    protocol            = "TCP"          # Here, If you want to use HTTP/HTTPS protocol, then pass path and matcher attributes as above example
    enabled             = true
  }
  providers = {
    aws = aws
  }
}
```