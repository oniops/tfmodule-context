module "ctx" {
  source = "../"

  context = {
    aws_profile = "terran"
    region      = "ap-northeast-2"
    project     = "apple"
    environment = "Production"
    team        = "DevOps"
    owner       = "owner@academyiac.ml"
    # team_name   = "Devops Transformation"
    # cost_center = "20211129"
    domain      = "academyiac.ml"
    pri_domain  = "applegoods.local"
  }
}
