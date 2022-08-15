variable vpc_cidr_block {
  description = "VPC CIDR Block"
  type = string
  default = "10.0.0.0/16"
}

variable subnet_cidr_blocks {
  description = "Subnet CIDR Blocks"
  type = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable private_subnet_cidr_blocks {
  description = "Private Subnet CIDR Blocks"
  type = list(string)
  default = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable namespace {
  type = string
}

variable devops_ip {
  description = "CIDR block for ssh to servers"
  type = string
}
