
# 모듈 구조를 중점적으로 보자
# provider를 부모 모듈에 적용했다.

provider "aws" {
    region = "us-west-1"
}

provider "aws" {
    alias = "seoul"
    region = "ap-northeast-2"
}

module "ec2_california" {
    source = "../modules/terraform-aws-ec2"
}

module "ec2_seoul" {
    source = "../modules/terraform-aws-ec2"
    providers = {
        aws = aws.seoul
    }
    instance_type = "t3.small"
}


output "module_output_california" {
    value = module.ec2_california.private_ip  # California 모듈의 private_ip
}

output "module_output_seoul" {
    value = module.ec2_seoul.private_ip  # Seoul 모듈의 private_ip
}