locals {
  add_eks_context      = var.eks_simple_name != null
  eks_cluster_name     = local.add_eks_context ? "${local.name_prefix}-${var.eks_simple_name}-eks" : ""
  cluster_version      = local.add_eks_context ? data.aws_eks_cluster.this[0].version : ""
  cluster_endpoint     = local.add_eks_context ? data.aws_eks_cluster.this[0].endpoint : ""
  cluster_auth_base64  = local.add_eks_context ? data.aws_eks_cluster.this[0].certificate_authority[0].data : ""
  cluster_service_cidr = local.add_eks_context ? data.aws_eks_cluster.this[0].kubernetes_network_config[0].service_ipv4_cidr : ""
  oidc_provider_issuer = local.add_eks_context ? replace(data.aws_eks_cluster.this[0].identity[0].oidc[0].issuer, "https://", "") : ""
  oidc_provider_arn    = local.add_eks_context ? "arn:aws:iam::${local.account_id}:oidc-provider/${local.oidc_provider_issuer}" : ""
  eks_context = merge(local.context,
      local.add_eks_context ? {
      cluster_simple_name    = var.eks_simple_name
      node_security_group_id = var.node_security_group_id
      cluster_name           = local.eks_cluster_name
      cluster_version        = local.cluster_version
      cluster_endpoint       = local.cluster_endpoint
      cluster_auth_base64    = local.cluster_auth_base64
      cluster_service_cidr   = local.cluster_service_cidr
      service_ipv4_cidr      = local.cluster_service_cidr
      oidc_provider_arn      = local.oidc_provider_arn
    } : local.context
  )

}
