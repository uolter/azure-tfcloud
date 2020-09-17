terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "uolter"
    workspaces {
      prefix = "azure-"
    }
  }
}

provider "azurerm" {
  version = "=2.22.0"
  features {}
}

resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = var.environment
  }
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_mame
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = var.environment
  }
}
