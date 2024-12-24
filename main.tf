locals {
  account_id = data.aws_caller_identity.current.account_id
  user_arn   = data.aws_caller_identity.current.arn
  region_alias = lookup(local.aws_region_codes, var.context.region, "nn")
  environment = lower(var.context.environment)
  env_alias = substr(local.environment, 0, 1)
  env_cd = lookup(local.env_codes, var.context.environment, "nn")
  env_code   = local.env_cd != "nn" ? local.env_cd : substr(local.environment, 0, 3)
  owner = var.owner != null ? var.owner : var.context.owner

  local_tags = {
    Project     = var.context.project
    Environment = var.context.environment
    Department  = var.context.department
    Owner       = local.owner
    Customer    = var.context.customer
    ManagedBy   = var.provisioner
  }

  name_prefix      = var.name_prefix == null ? format("%s-%s%s", var.context.project, local.region_alias, local.env_alias) : var.name_prefix
  s3_bucket_prefix = local.name_prefix # var.context.s3_prefix_cd == "region" ? local.name_prefix : format("%s-%s", var.context.project, local.env_code)

  tags = merge(
    ( var.cost_center != null ? { CostCenter = var.cost_center } : {} ),
    ( var.team != null ? {
      OpsNowService = var.team
      Team          = var.team
    } : {} ),
    local.local_tags,
    var.additional_tags
  )

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
    me-central-1   = "mc1",
    sa-east-1      = "se1",
    us-east-1      = "ue1",
    us-east-2      = "ue2",
    us-west-1      = "uw1",
    us-west-2      = "uw2",
  }

  # Environment Codes
  env_codes = {
    Production  = "prd",
    Prod        = "prd",
    Development = "dev",
    Dev         = "dev",
    Stage       = "stg",
    Stg         = "stg",
    PoC         = "poc",
    Testbed     = "tbd",
    Test        = "tst",
  }

}
