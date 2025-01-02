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
