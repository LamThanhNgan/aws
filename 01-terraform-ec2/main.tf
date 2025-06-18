
module "network" {
  source = "./network"
}

module "ec2" {
  source = "./ec2"
  ec2-sg = [module.network.ec2-sg-id]
  subnet_id = module.network.subnet_ids
}