
# 모듈 구조를 중점적으로 보자
# provider를 부모 모듈에 적용했다.

provider "aws" {
    region = "ap-northeast-2"
}

module "ec2_seoul" {
    source = "../modules/terraform-aws-ec2"
    count = 2  # count로 반복 구문 적용
    instance_type = "t3.small"
}

output "module_output" {
    value = module.ec2_seoul[*].private_ip
}

