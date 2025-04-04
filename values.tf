locals {
  context = {
    # aws_profile  = var.context.aws_profile
    account_id       = local.account_id
    sts_identity_arn = local.sts_identity_arn
    project          = var.context.project
    region           = var.context.region
    region_alias     = local.region_alias
    environment      = var.context.environment
    env_alias        = local.env_alias
    env_code         = local.env_code
    department       = var.context.department
    owner            = local.owner
    team             = var.team
    cost_center      = var.cost_center
    domain           = var.context.domain
    pri_domain       = var.context.pri_domain
    name_prefix      = local.name_prefix
    s3_bucket_prefix = local.s3_bucket_prefix
    tags             = local.tags
  }
}