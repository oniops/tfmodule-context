variable "context" {
  type = object({
    # profile         = string # Identify a specific profile that used by provisioners like terraform.
    project           = string # project name is usally account's project name or platform name
    region            = string # describe default region to create a resource from aws
    environment       = string # Distinguish between development, test, and production resources
    department        = string # Organization name of BSP
    owner             = string # Identify who is responsible for the resource
    customer          = string # Identify a specific client that a particular group of resources serves
    domain            = string # public toolchain domain name (ex, tools.customer.co.kr)
    pri_domain        = string # private domain name (ex, tools.customer.co.kr)
  })
}

variable "custom_context" {
  type    = map(string)
  default = null
}


variable "name_prefix" {
  description = "resource name prefix"
  type        = string
  default     = null
}

variable "is_s3_global_name_prefix" {
  description = "s3 bucket prefix. If not set, it use name_prefix"
  type        = bool
  default     = false
}

variable "team" {
  description = "The of team"
  type        = string
  default     = null
}

variable "owner" {
  description = "resource owner. like email"
  type        = string
  default     = null
}

variable "additional_tags" {
  description = "Additional tags for all resources"
  type        = map(string)
  default     = {}
}

variable "cost_center" {
  description = "Identify the cost center or business unit associated with a resource, typically for cost"
  type        = number
  default     = null
}

variable "eks_simple_name" {
  description = "EKS Cluster simple name"
  type        = string
  default     = null
}

variable "node_security_group_id" {
  description = "SecurityGroup ID of EKS Node"
  type        = string
  default     = null
}

variable "provisioner" {
  description = "Provisioner tool like terraform, cloudformation"
  type        = string
  default     = "Terraform"
}
