##################################################################################
# DATA SOURCES
##################################################################################
data "azurerm_network_security_group" "db_nsg" {
  name                = "db-nsg"
  resource_group_name = var.res_group
}

##################################################################################
# CONFIGURATION
##################################################################################
# Create db subnet within virtual network
resource "azurerm_subnet" "db_subnet" {
  name                 = "db-subnet"
  resource_group_name  = var.res_group
  virtual_network_name = var.network
  address_prefixes     = ["10.0.2.0/24"]
}

# Create security group associations
resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  network_security_group_id = data.azurerm_network_security_group.db_nsg.id
  subnet_id                 = azurerm_subnet.db_subnet.id
}