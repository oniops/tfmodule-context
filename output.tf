output "context" {
  value = local.context
}

output "context_string" {
  value = join(",", [for key, value in var.context : try("${key}=${value}", "")])
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

# EKS Cluster
output "eks_context" {
  value = local.eks_context
  description = <<-EOF
You can refer to EKS Context according to the two situations below.

  # Case 1: exists EKS
  eks_context = module.ctx.eks_context

  # Case 2: Creating EKS
  locals {
    eks_context = merge(module.ctx.context,
      {
        cluster_name           = local.name_prefix}-{var.cluster_simple_name}-eks
        cluster_simple_name    = var.cluster_simple_name
        cluster_version        = var.cluster_version
        service_ipv4_cidr      = module.eks.service_ipv4_cidr
        oidc_provider_arn      = module.eks.oidc_provider_arn
        cluster_auth_base64    = module.eks.cluster_auth_base64
        cluster_endpoint       = module.eks.cluster_endpoint
        node_security_group_id = module.eks.node_security_group_id
      })
  }

  eks_context = local.eks_context
EOF
}

output "eks_cluster_name" {
  value = local.eks_cluster_name
}

output "eks_cluster_version" {
  value = local.cluster_version
}

output "eks_cluster_endpoint" {
  value = local.cluster_endpoint
}


output "eks_cluster_auth_base64" {
  value = local.cluster_auth_base64
}

output "eks_cluster_service_cidr" {
  value = local.cluster_service_cidr
}

output "eks_oidc_provider_arn" {
  value = local.oidc_provider_arn
}
