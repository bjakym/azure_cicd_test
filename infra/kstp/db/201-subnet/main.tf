data "azurerm_virtual_network" "kstp_network" {
  name                = var.network
  resource_group_name = var.res_group
}


resource "azurerm_subnet" "db_subnet" {
  name                 = "db-subnet"
  resource_group_name  = var.res_group
  virtual_network_name = data.azurerm_virtual_network.kstp_network.name
  address_prefixes     = ["10.0.2.0/24"] 
}