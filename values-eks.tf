locals {
  add_eks_context      = var.eks_simple_name != null
  eks_cluster_name     = "${local.name_prefix}-${var.eks_simple_name}-eks"
  oidc_provider_issuer = local.add_eks_context ? replace(data.aws_eks_cluster.this[0].identity[0].oidc[0].issuer, "https://", "") : ""

  eks_context = merge(local.context,
      local.add_eks_context ? {
      cluster_simple_name  = var.eks_simple_name
      cluster_name         = local.eks_cluster_name
      cluster_version      = data.aws_eks_cluster.this[0].version
      cluster_endpoint     = data.aws_eks_cluster.this[0].endpoint
      cluster_auth_base64  = data.aws_eks_cluster.this[0].certificate_authority[0].data
      cluster_service_cidr = data.aws_eks_cluster.this[0].kubernetes_network_config[0].service_ipv4_cidr
      service_ipv4_cidr    = data.aws_eks_cluster.this[0].kubernetes_network_config[0].service_ipv4_cidr
      oidc_provider_arn    = "arn:aws:iam::${local.account_id}:oidc-provider/${local.oidc_provider_issuer}"
    } : local.context
  )

}
