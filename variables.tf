variable "context" {
  type = object({
    region      = string # describe default region to create a resource from aws
    project     = string # project name is usally account's project name or platform name
    environment = string # Runtime Environment such as develop, stage, production
    owner       = string # project owner
    domain      = string # public toolchain domain name (ex, tools.customer.co.kr)
    pri_domain  = string # private domain name (ex, tools.customer.co.kr)
    team        = optional(string) # Team name of Devops Transformation
    cost_center = optional(string) # Cost Center
    aws_profile = optional(string) # describe a specifc profile to access a aws cli
  })
}

variable "name_prefix" {
  description = "resource name prefix"
  type        = string
  default     = null
}

variable "additional_tags" {
  description = "Additional tags for all resources"
  type        = map(string)
  default     = {}
}

