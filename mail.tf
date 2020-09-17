provider "azurerm" {
  version = "=2.22.0"
  features {}
}

terraform {
  backend "remote" {
    hostname              = "app.terraform.io"
    organization          = "uolter"
    workspaces {
      prefix              = "uolter"
    }
  }
}

resource "azurerm_resource_group" "resource_group" {
  name     = "tfcloud-rf"
  location = "westeurope"

  tags = {
    environment = "dev"
  }
}
