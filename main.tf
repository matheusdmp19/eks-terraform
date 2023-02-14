terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.54.0"
    }
  }
  backend "s3" {
    bucket = "matheusdmp19-remote-state"
    key    = "eks-terraform/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      owner      = "matheus.pinho"
      managed-by = "terraform"
    }
  }
}

module "network" {
  source = "./modules/network"

  cluster_name = var.cluster_name
  aws_region   = var.aws_region
}
