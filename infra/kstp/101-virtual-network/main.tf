resource "azurerm_virtual_network" "kstp_network" {
  name                = var.network
  location            = var.location
  resource_group_name = var.res_group
  address_space       = ["10.0.0.0/16"]
}