terraform {
  required_version = ">= 1.0.0"
  backend "s3" {
    profile = "single"
    bucket = "treez-nnvkdyiue-terraform"
    key = "terraform.tfstate"
    region = "us-west-2"
    encrypt = true
  }
}

provider "aws" {
  region = "us-west-2"
  profile = "single"
}

module "networking" {
  source = "./modules/networking"
  namespace = var.namespace
  devops_ip = var.devops_ip
}

module "ec2" {
  source = "./modules/ec2"
  namespace = var.namespace

  vpc = module.networking.vpc
  security_group = module.networking.sg.webserver
  subnet_ids = module.networking.vpc.public_subnets
}
