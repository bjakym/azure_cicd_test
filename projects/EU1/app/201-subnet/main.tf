##################################################################################
# DATA SOURCES
##################################################################################
data "azurerm_network_security_group" "app_nsg" {
  name                = "app-nsg"
  resource_group_name = var.res_group
}

##################################################################################
# CONFIGURATION
##################################################################################
# Create db subnet within virtual network
resource "azurerm_subnet" "app_subnet" {
  name                 = "app-subnet"
  resource_group_name  = var.res_group
  virtual_network_name = var.network
  address_prefixes     = ["10.0.1.0/24"]
}

# Create security group associations
resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  network_security_group_id = data.azurerm_network_security_group.app_nsg.id
  subnet_id                 = azurerm_subnet.app_subnet.id
}