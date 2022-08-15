output "vpc" {
  value = module.vpc
}

output "sg" {
  value = {
    webserver = module.webserver_sg.security_group_id
  }
}
