data "aws_caller_identity" "current" {}


data "aws_eks_cluster" "this" {
  count = local.add_eks_context ? 1 : 0
  name = local.eks_cluster_name
}
