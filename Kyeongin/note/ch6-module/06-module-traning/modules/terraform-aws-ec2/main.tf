# Terraform 0.13 and later:

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_default_vpc" "default" {}

data "aws_ami" "default" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "owner-alias"
        values = ["amazon"]
    }

    filter {
        name = "name"
        values = ["amzn2-ami-hvm*"]
    }
}

resource "aws_vpc" "main" {
  depends_on = [aws_default_vpc.default]
  ami = data.aws_ami.default.id
  instance_tenancy = "var.instance_type"

  tags = {
    Name = "var.instance_name"
  }
}