module "network" {
    source = "./network"
}

module "ecs" {
    source = "./ecs"
    security_group_id = module.network.security_group_id
    subnet_ids = module.network.subnet_ids
}