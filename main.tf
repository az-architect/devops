// provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.97.0"
    }
  }
}


provider "azurerm" {
   features {}
}

// create resource group 
resource "azurerm_resource_group" "azdevops" {
  name     = "azdevops"
  location = "West Europe"
}