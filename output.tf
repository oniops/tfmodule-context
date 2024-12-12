output "context" {
  value = {
    # aws_profile  = var.context.aws_profile
    account_id       = local.account_id
    project          = var.context.project
    region           = var.context.region
    region_alias     = local.region_alias
    environment      = var.context.environment
    env_alias        = local.env_alias
    env_code         = local.env_code
    department       = var.context.department
    owner            = var.context.owner
    team             = var.context.team
    cost_center      = var.cost_center
    domain           = var.context.domain
    pri_domain       = var.context.pri_domain
    name_prefix      = local.name_prefix
    s3_bucket_prefix = local.s3_bucket_prefix
    tags             = local.tags
  }
}

output "context_string" {
  value = join(",", [for key, value in var.context : try("${key}=${value}","")])
}

output "name_prefix" {
  value = local.name_prefix
}

output "account_id" {
  value = local.account_id
}

output "s3_bucket_prefix" {
  value = local.s3_bucket_prefix
}

output "tags" {
  value = local.tags
}

output "tags_string" {
  value = join(",", [for key, value in local.tags : "${key}=${value}"])
}

output "region" {
  value = var.context.region
}

output "region_alias" {
  value = local.region_alias
}

output "project" {
  value = var.context.project
}

output "environment" {
  value = var.context.environment
}

output "env_alias" {
  value = local.env_alias
}

output "env_code" {
  value = local.env_code
}

output "owner" {
  value = var.context.owner
}

output "team" {
  value = var.context.team
}

output "cost_center" {
  value = var.cost_center
}

output "domain" {
  value = var.context.domain
}

output "pri_domain" {
  value = var.context.pri_domain
}
