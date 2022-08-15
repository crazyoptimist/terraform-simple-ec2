resource "random_shuffle" "public_subnet_id" {
  input = var.subnet_ids
  result_count = 1
}

data "aws_ami" "ubuntu-focal" {
  most_recent = true
  owners = ["099720109477"]
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_key_pair" "ssh-key" {
  key_name = "webserver-key"
  public_key = file(var.public_key_location)
}

resource "aws_instance" "dev" {
  ami = data.aws_ami.ubuntu-focal.id
  instance_type = var.instance_type
  key_name = aws_key_pair.ssh-key.key_name
  subnet_id = join(",", random_shuffle.public_subnet_id.result)
  vpc_security_group_ids = [var.security_group]
  tags = {
    Name = "${var.namespace}_dev"
    instance_type = var.instance_type
  }
  volume_tags = {
    Name = "${var.namespace}_dev"
  }
}
