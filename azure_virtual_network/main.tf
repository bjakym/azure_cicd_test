resource "azurerm_virtual_network" "app_network" {
  name                = "app-network"
  location            = var.location
  resource_group_name = var.res_group
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "Subnet-A20"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "Subnet-B20"
    address_prefix = "10.0.2.0/24"
  }
}