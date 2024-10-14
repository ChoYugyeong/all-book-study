provider "aws"{
    region = "ap-northeast-2"
}

locals {
  env = {
    dev = {
        type = "t3.micro"
        name = "dev_ec2"
    }
    prod = {
        type = "m5.large"
        name = "prod_ec2"
    }
  }
}


module "ec2-seoul" {
    # count = 2
    for_each = local.env
    source = "../modules/terraform-aws-ec2"
    instance_type = each.value.type
    instance_name = each.value.name
}

output "module_output" {
    # value = module.ec2-seoul[*].private_ip
    value = [
        for k in module.ec2.seoul: k.private_ip
    ]
}