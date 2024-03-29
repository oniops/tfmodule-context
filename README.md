# tfmodule-context

tfmodule-context 테라폼 모듈은 클라우드 서비스 및 리소스를 정의 하는데 표준화된 네이밍 정책과 태깅 규칙을 지원 하고, 일관성있는 데이터소스 참조 모델을 제공 합니다.

## Usage

```hcl
module "ctx" {
  source = "git::https://code.bespinglobal.com/scm/op/tfmodule-context.git?ref=v1.0.0"

  context = {
    region      = "ap-northeast-2"
    project     = "apple"
    environment = "Production"
    owner       = "owner@academyiac.ml"
    team_name   = "Devops Transformation"
    team        = "DX"
    cost_center = "20211129"
    domain      = "academyiac.ml"
    pri_domain  = "applegoods.local"
  }
}


# Using context variables from ctx module
locals {
  context     = module.ctx.context
  tags        = module.ctx.tags
  region      = module.ctx.region
  project     = module.ctx.project
  environment = module.ctx.environment
  domain      = module.ctx.domain
  pri_domain  = module.ctx.pri_domain
  name_prefix = module.ctx.name_prefix
}
```

# Input Variables

| Name            | Description                                                     | Type           | Example               | Required |
|-----------------|-----------------------------------------------------------------|----------------|-----------------------|:--------:|
| context         | 프로젝트 또는 프로덕트를 위한 컨텍스트 정보를 정의 합니다. 이를 통해 일관된 네이밍과 태그 속성을 지원 합니다. | object(string) | -                     |   Yes    |
| name_prefix     | 리소스 네이밍 규칙을 위한 접두어 입니다. 자동으로 구성 되니 정의하지 않는것을 권고 합니다.            | string         | -                     |    No    |
| additional_tags | 태그 속성을 추가 하고자 하는 경우 정의 합니다.                                     | map(string)    | { MyKey1 = "Value1" } |    No    |

## Output

| Name         | Description                                         | 
|--------------|-----------------------------------------------------|
| context      | 프로젝트 또는 프로덕트를 위한 컨텍스트 정보 객체 입니다.                    |
| name_prefix  | 리소스 생성시 네이밍 규칙을 위한 접두어 값 입니다.                       |
| tags         | 리소스 생성시 적용 될 태그 값 입니다.                              |
| region       | AWS 리전입니다.                                          |
| region_alias | AWS 리전 별칭 입니다.                                      |
| project      | 프로젝트 이름 입니다.                                        |
| environment  | 환경(Production, Development, Stage, ..)을 대표하는 값 입니다. |
| env_alias    | 환경 값 별칭 입니다.                                        |
| owner        | 프로젝트 또는 프로덕트의 Owner 입니다.                            |
| team         | 팀 이름 입니다.                                           |
| cost_center  | 비용 집계를 위한 Code Center 코드 입니다.                       |
| domain       | Public 도메인 입니다.                                     |
| pri_domain   | Private 도메인 입니다.                                    |

