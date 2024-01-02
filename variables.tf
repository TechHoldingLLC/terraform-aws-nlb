####################
# nlb/variables.tf #
####################

## NLB related variables
variable "create_nlb" {
  description = "Create NLB"
  type        = bool
  default     = false
}

variable "create_nlb_listener" {
  description = "Create NLB Listener"
  type        = bool
  default     = false
}

variable "name" {
  description = "The name of the LB"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "internal" {
  description = "If true, the LB will be internal"
  type        = bool
  default     = true
}

# Please note that one of either subnets or subnet_mapping is required.
# Difference between subnet and subnet_mapping : https://stackoverflow.com/questions/74096885/aws-what-is-the-difference-between-subnet-and-subnet-mapping#:~:text=Subnet%20mappings%20%2D%20are,specified%20CIDR%20range.
variable "subnets" {
  description = "Subnets to host NLB"
  type        = list(string)
  default     = []
}

variable "subnet_mapping" {
  description = "A list of subnet IDs to attach to the LB"
  type = list(object({
    allocation_id        = string # The allocation ID of the Elastic IP address for an internet-facing load balancer.
    ipv6_address         = string # An ipv6 address within the subnet to assign to the internet-facing load balancer.
    private_ipv4_address = string # A private ipv4 address within the subnet to assign to the internal-facing load balancer.
    subnet_id            = string # The id of the subnet of which to attach to the load balancer. You can specify only one subnet per Availability Zone.
  }))
  default = []
}
# reference for subnet_mapping: https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_SubnetMapping.html

variable "security_group_ids" {
  description = "NLB security group id"
  type        = list(string)
  default     = []
}

variable "access_logs" {
  description = "An Access Logs block"
  type = list(object({
    bucket  = string
    prefix  = string
    enabled = bool
  }))
  default = []
}

variable "enable_cross_zone_load_balancing" {
  description = "If true, cross-zone load balancing of the load balancer will be enabled."
  type        = bool
  default     = true
}

variable "enable_deletion_protection" {
  description = "If true, deletion of the load balancer will be disabled via the AWS API."
  type        = bool
  default     = true
}

## Listener and Target Group related variables 
variable "nlb_arn" {
  description = "NLB arn" # It is required if you have set the value of var.create_nlb = false
  type        = string
  default     = ""
}

variable "target_group_name" {
  description = "Target group name"
  type        = string
  default     = ""
}

variable "port" {
  description = "Listener port"
  type        = number
  default     = 80
}

variable "protocol" {
  description = "Protocol for Listener & Target Group"
  type        = string
  default     = "TCP"
}

variable "target_type" {
  description = "Type of target that you must specify when registering targets with this target group"
  type        = string
  default     = "ip"
}

variable "deregistration_delay" {
  description = "Amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused."
  type        = number
  default     = 60
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
  default     = ""
}

variable "health_check" {
  description = "Listener Rule Health Check"
  type        = map(string)
  default     = {}
}