
data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["dbx-digital-${var.common_service_env}-main-vpc"]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "tag:Name"
    values = ["dbx-digital-${var.common_service_env}-private-subnet"]
  }
}

data "aws_security_group" "secgrp" {
  vpc_id = data.aws_vpc.vpc.id
    filter {
    name   = "tag:Name"
    values = ["dbx-digital-${var.common_service_env}-main-security-group"]
  }
}
