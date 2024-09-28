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
  account_replication_type = "LRS"

  static_website {
    index_document = var.index_document
  }
}

resource "azurerm_storage_blob" "uo_index_html" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.uo_sa_web.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "${var.source_content}${local.web_suffix}" 
}

output "primary_web_endpoint" {
  value = azurerm_storage_account.uo_sa_web.primary_web_endpoint
}