terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "uo_backend_rg"
    storage_account_name = "uo1backend1sa5hl8swws"
    container_name       = "uo-sc-backend"
    key                  = "project_b.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "30ee9279-e76e-409d-8973-00c9792f6bcb"
  features {

  }
}

resource "azurerm_resource_group" "rg_b" {
  name     = var.resource_group_name
  location = var.location
}

# Added when importing the module
module "storage" {
  source               = "../modules/storage"
  storage_account_name = var.storage_account_name
  resource_group_name  = azurerm_resource_group.rg_b.name
  location             = azurerm_resource_group.rg_b.location
}