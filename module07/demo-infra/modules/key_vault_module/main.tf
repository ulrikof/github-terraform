data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name                        = var.kv_name
  location                    = var.location
  resource_group_name         = var.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = var.kv_sku

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]
  }
  network_acls {
    bypass         = "AzureServices"
    default_action = "Deny"
  }
}

# Secret containing the username used by linux vm 01
resource "azurerm_key_vault_secret" "vm_username" {
  name         = var.kv_secret_username_name
  value        = var.vm_username
  key_vault_id = azurerm_key_vault.key_vault.id
}

# Secret containing the password used by linux vm 01
resource "azurerm_key_vault_secret" "vm_password" {
  name         = var.kv_secret_password_name
  value        = var.vm_password
  key_vault_id = azurerm_key_vault.key_vault.id
}

# Secret containing the storage account access key
resource "azurerm_key_vault_secret" "storage_account_key" {
  name         = var.kv_secret_sa_access_key_name
  value        = var.sa_access_key
  key_vault_id = azurerm_key_vault.key_vault.id
}