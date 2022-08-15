data "aws_availability_zones" "available" {}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "defendredcon-vpc"
  cidr = var.vpc_cidr_block

  azs = data.aws_availability_zones.available.names
  private_subnets = var.private_subnet_cidr_blocks
  public_subnets  = var.subnet_cidr_blocks
}

module "webserver_sg" {
  source = "terraform-aws-modules/security-group/aws"
  name = "${var.namespace}_webserver_sg"
  description = "Security group for webserver"
  vpc_id = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = "0.0.0.0/0"
      ipv6_cidr_blocks = "::/0"
    },
    {
      rule = "ssh-tcp"
      cidr_blocks = var.devops_ip
    },
  ]

  egress_with_cidr_blocks = [
    {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = "0.0.0.0/0"
      ipv6_cidr_blocks = "::/0"
    },
  ]
}
