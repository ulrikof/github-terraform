terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.2.0"
    }

  }
}

terraform {
  backend "azurerm" {
    resource_group_name  = "uo_backend_rg"
    storage_account_name = "uo1backend1sa0oxn7wsp"
    container_name       = "uo-sc-backend"
    key                  = "staticwebsite.terraform.tfstate"
  }
}

provider "azurerm" {
  features {
  }
}
