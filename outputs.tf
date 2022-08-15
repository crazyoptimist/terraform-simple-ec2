output "instances_ips" {
  value = {
    dev = module.ec2.instances.dev.public_ip
  }
}
