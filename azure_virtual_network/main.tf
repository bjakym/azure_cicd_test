locals {
  resource_group_name = "${var.res_group}"
  location = "${var.location}"
}

data "azurerm_resource_group" "setup" {
  name = local.resource_group_name
}

resource "azurerm_virtual_network" "app_network" {
  name                = "app-network"
  location            = local.location
  resource_group_name = data.azurerm_resource_group.setup.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "Subnet-A"
    address_prefix = "10.0.1.0/24"
  }  
}
