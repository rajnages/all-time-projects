terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "terraform-environments-workspaces"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region_name
}

module "vpc" {
  source              = "./vpc"
  vpc_cidr            = var.vpc_cidr
#   vpc_name            = var.vpc_name
  public_subnet_cidr  = var.public_subnet_cidr
  azs                 = var.azs
  private_subnet_cidr = var.private_subnet_cidr
}

module "security-groups" {
  source = "./securiy-groups"
  vpc_id = module.vpc.aws_vpc
  sg_name = var.sg_name
}

module "ec2_instances" {
  source              = "./ec2_instances"
  vpc_id              = module.vpc.aws_vpc
  public_subnet_ids   = module.vpc.aws_subnet
  aws_security_group  = module.security-groups.aws_security_group
  aws_instance_type   = var.aws_instance_type
  key_name            = var.key_name
  ami                 = var.ami
}
