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


terraform {
  backend "azurerm" {
    resource_group_name  = "azdevops"
    storage_account_name = "storageazdevopsalilia"
    container_name       = "blobazdevops"
    key                  = "terraform.tfstate"
  }
}

// create resource group 
resource "azurerm_resource_group" "azdevops" {
  name     = "azdevops"
  location = "West Europe"
}

resource "azurerm_storage_account" "storageazdevopsalilia" {
  name                     = "storageazdevopsalilia"
  resource_group_name      = "azdevops"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "blobazdevops" {
  name                  = "blobazdevops"
  storage_account_name  = "storageazdevopsalilia"
  container_access_type = "private"
}