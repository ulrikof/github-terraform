output "kv_id" {
  value = azurerm_key_vault.key_vault.id
}

output "kv_secret_username_name" {
  value = azurerm_key_vault_secret.vm_username.name
}

output "kv_secret_password_name" {
  value = azurerm_key_vault_secret.vm_password.name
}