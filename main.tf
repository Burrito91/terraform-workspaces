provider "aws" {
  region = "eu-west-2"
}

locals {
  env = terraform.workspace

  ec2_instance_type = {
    default = "t3.micro"
    dev     = "t3.micro"
    staging = "t3.small"
  }
}

module "vpc" {
  source               = "./modules/vpc"
  name                 = "production-${terraform.workspace}"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}
