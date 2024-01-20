##################################################################################
# TERRAFORM CONFIG
##################################################################################
terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "=3.0.0"
        }
    }
    backend "azurerm" {
        key = "virtual-network.terraform.tfstate"
    }
}

##########################################################################
# PROVIDERS
##################################################################################
provider "azurerm" {
  features {}
}