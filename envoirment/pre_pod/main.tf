module "resource_group" {
  source = "../../modules/resource_group"
  resource_groups = var.resource_groups
}

module "virtual_network" {
    source = "../../modules/virtual_network"
    vnet = var.vnet
    depends_on = [module.resource_group]
}

module "subnet" {
    source = "../../modules/subnet"
    subnet = var.subnet
    depends_on = [module.virtual_network, module.resource_group]
}

module "pip" {
  source = "../../modules/pip"
  pip = var.pip 
  depends_on = [module.resource_group, module.virtual_network, module.subnet]
}

module "compute" {
  source = "../../modules/compute"
  vms = var.vms
  depends_on = [module.resource_group, module.virtual_network, module.subnet, module.pip]
}