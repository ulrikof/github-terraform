resource "random_string" "random_string" {
  length  = 8
  special = false
  upper   = false
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
}

resource "azurerm_storage_account" "sa_web" {
  name                     = "${lower(var.sa_name)}${random_string.random_string.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  static_website {
    index_document = var.index_document
  }
}

resource "azurerm_storage_blob" "index_html" {
  name = var.index_document
  storage_account_name = azurerm_storage_account.sa_web.name
  storage_container_name = "$web"
  type = "Block"
  content_type = "text/html"
  source_content = var.source_content  
}


output "primary_web_endpoint" {
  value = azurerm_storage_account.sa_web.primary_web_endpoint
}