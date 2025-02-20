output "context" {
  value = local.context
}

output "context_string" {
  value = join(",", [for key, value in var.context : try("${key}=${value}","")])
}

output "name_prefix" {
  value = local.name_prefix
}

output "name_prefix_env" {
  value = local.name_prefix_env
}

output "s3_bucket_prefix" {
  value = local.s3_bucket_prefix
}

output "account_id" {
  value = local.account_id
}

output "sts_user_arn" {
  value = local.sts_user_arn
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
  value = var.team
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

output "eks_context" {
  value = local.eks_context
}
