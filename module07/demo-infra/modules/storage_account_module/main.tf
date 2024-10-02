terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

# Random string used added to the name of sa_01 to make a valid name
resource "random_string" "random_string" {
  length  = 8
  special = false
  upper   = false
}

resource "azurerm_storage_account" "sa_01" {
  name                     = "${lower(var.sa_01_base_name)}${random_string.random_string.result}"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

# Automatically creates the amount of storage containers defined by the variable "var.amount_of_storage_containers"
resource "azurerm_storage_container" "sc_01" {
  for_each              = { for id in local.container_list : id => id }
  name                  = "${lower(var.sc_01_base_name)}-0${each.key + 1}"
  storage_account_name  = azurerm_storage_account.sa_01.name
  container_access_type = "private"
}