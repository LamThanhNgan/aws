output "network_vpc_ids" {
    value = module.network.vpc_ids
}

output "network_subnet_ids" {
  value = module.network.subnet_ids
}

output "ec2-public_ip" {
  value = module.ec2.ec2-public-ip
}