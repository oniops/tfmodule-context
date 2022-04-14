locals {
  region_alias = lookup(local.aws_region_codes, var.context.region, "nn")
  env_alias    = lower(substr(var.context.environment, 0, 1))
  local_tags   = {
    Project     = var.context.project
    Environment = var.context.environment
    Team        = var.context.team
    Owner       = var.context.owner
  }

  name_prefix = var.name_prefix == null ? format("%s-%s%s", var.context.project, local.region_alias, local.env_alias) : var.name_prefix

  tags = merge(var.additional_tags, local.local_tags)

  # AWS Regions code and alias table.
  aws_region_codes = {
    ap-east-1      = "ae1",
    ap-northeast-1 = "an1",
    ap-northeast-2 = "an2",
    ap-northeast-3 = "an3",
    ap-southeast-1 = "as1",
    ap-southeast-2 = "as2",
    ca-central-1   = "cc1",
    cn-north-1     = "cn1",
    cn-northwest-1 = "cnw1",
    eu-central-1   = "ec1",
    eu-north-1     = "en1",
    eu-south-1     = "es1",
    eu-west-1      = "ew1",
    eu-west-2      = "ew2",
    eu-west-3      = "ew3",
    me-south-1     = "ms1",
    sa-east-1      = "se1",
    us-east-1      = "ue1",
    us-east-2      = "ue2",
    us-west-1      = "uw1",
    us-west-2      = "uw2",
  }
}
