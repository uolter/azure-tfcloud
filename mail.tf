provider "azurerm" {
  version = "=2.22.0"
  features {}
}

resource "azurerm_resource_group" "resource_group" {
  name     = "tfcloud-rf"
  location = "westeurope"

  tags = {
    environment = "dev"
  }
}
