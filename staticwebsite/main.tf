locals {
  workspace_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  rg_name    = terraform.workspace == "default" ? "${var.rg_name}" : "${var.rg_name}-${terraform.workspace}"
  sa_name    = terraform.workspace == "default" ? "${var.sa_name}" : "${var.sa_name}-${terraform.workspace}"
  web_suffix = "<h1>${terraform.workspace}</h1>"
}

resource "random_string" "random_string" {
  length  = 8
  special = false
  upper   = false
}

# Create resource group
resource "azurerm_resource_group" "uo_rg_web" {
  name     = local.rg_name
  location = var.location
}

# Create storage account
resource "azurerm_storage_account" "uo_sa_web" {
  name                     = "${lower(local.sa_name)}${random_string.random_string.result}"
  resource_group_name      = azurerm_resource_group.uo_rg_web.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  static_website {
    index_document = "index.html"
  }
}

# Ensure the $web container exists
resource "azurerm_storage_container" "web_container" {
  name                  = "$web"
  storage_account_name  = azurerm_storage_account.uo_sa_web.name
  container_access_type = "blob"
}

# Create the blob for the index.html
resource "azurerm_storage_blob" "uo_index_html" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.uo_sa_web.name
  storage_container_name = azurerm_storage_container.web_container.name
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "${var.source_content}${local.web_suffix}"
}

output "primary_web_endpoint" {
  value = azurerm_storage_account.uo_sa_web.primary_web_endpoint
}
