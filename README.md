# tfmodule-context

tfmodule-context 테라폼 모듈은 클라우드 서비스 및 리소스를 정의 하는데 표준화된 네이밍 정책과 태깅 규칙을 지원 하고, 일관성있는 데이터소스 참조 모델을 제공 합니다.

## Usage

`tfmodule-context` 모듈을 사용하는 프로젝트에서는 `module.ctx.context` output 값 중 필요한 속성만 취할 수 있습니다. 예를들어 `project`, `name_prefix`, `region`, `domain`, `pri_domain` 속성만 필요하면, 아래 locals 에 정의한 것과 같이 사용할 수 있습니다.

```hcl
# Using context variables from ctx module
module "ctx" {
  source = "git::https://github.com/oniops/tfmodule-context.git?ref=v1.3.3"

  context = {
    region      = "ap-northeast-2"
    project     = "apple"
    environment = "Production"
    owner       = "owner@academyiac.ml"
    team        = "DX"
    cost_center = "20211129"
    domain      = "mydemo.io"
    pri_domain  = "mydemo.internal"
  }
}

locals {
  project     = module.ctx.project
  name_prefix = module.ctx.name_prefix
  region      = module.ctx.region
  tags        = module.ctx.tags
  domain      = module.ctx.domain
  pri_domain  = module.ctx.pri_domain
}
```

# Input Variables

| Name            | Description                                                                                                        | Type           | Example               | Required |
|-----------------|--------------------------------------------------------------------------------------------------------------------|----------------|-----------------------|:--------:|
| context         | It define context information of the project or product so that can support consistenly naming and tagging policy. | object(string) | -                     |   Yes    |
| name_prefix     | This is set automatically internally, so it is recommended not to define it.                                       | string         | -                     |    No    |
| additional_tags | Define tags if additional tags are required.                                                                       |  map(string)   | { MyKey1 = "Value1" } |    No    |

## Output

| Name         | Description                                         | 
|--------------|-----------------------------------------------------|
| context      | 프로젝트 또는 프로덕트를 위한 컨텍스트 정보 객체 입니다.           |
| name_prefix  | 리소스 생성시 네이밍 규칙을 위한 접두어 값 입니다.               |
| tags         | 리소스 생성시 적용 될 태그 값 입니다.                         |
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

