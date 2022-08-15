variable public_key_location {
  description = "SSH public key location"
  type = string
  default = "~/.ssh/id_rsa.pub"
}

variable instance_type {
  description = "EC2 instance type"
  type = string
  default = "t2.medium"
}

variable namespace {}

variable security_group {
  type = string
  description = "sg id"
}

variable vpc {}

variable subnet_ids {
  type = list(string)
}
