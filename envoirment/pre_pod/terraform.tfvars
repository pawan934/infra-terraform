resource_groups = {
  "rg-pre-pod" = {
    name     = "rg-pre-pod"
    location = "centralindia"
  }
}

vnet = {
  "vnet-pre-pod" = {
    name                = "vnet-pre-pod"
    location            = "centralindia"
    resource_group_name = "rg-pre-pod"
    address_space       = ["10.0.0.0/16"]
  }
}

subnet = {
  "subnet-pre-pod-frontend" = {
    name                 = "subnet-pre-pod-frontend"
    resource_group_name  = "rg-pre-pod"
    virtual_network_name = "vnet-pre-pod"
    address_prefixes     = ["10.0.1.0/24"]
  }
  "subnet-pre-pod-backend" = {
    name                 = "subnet-pre-pod-backend"
    resource_group_name  = "rg-pre-pod"
    virtual_network_name = "vnet-pre-pod"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

pip = {
  "pip-pre-pod-frontend" = {
    name                = "pip-pre-pod-frontend"
    resource_group_name = "rg-pre-pod"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  "pip-pre-pod-backend" = {
    name                = "pip-pre-pod-backend"
    resource_group_name = "rg-pre-pod"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}

vms = {
  vm-pre-pod-frontend-01 = {
    nic_name            = "nic-pre-pod-frontend-01"
    location            = "centralindia"
    resource_group_name = "rg-pre-pod"
    ip_config_name      = "ipconfig-pre-pod-frontend-01"
    vm_name             = "frontend-01"
    subnet_name         = "subnet-pre-pod-frontend"
    vnet_name           = "vnet-pre-pod"
    pip_name            = "pip-pre-pod-frontend"
  }
}
