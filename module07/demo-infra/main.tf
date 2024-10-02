# Root resource group where all the modules is placed
resource "azurerm_resource_group" "rg_root" {
  name     = var.rg_name
  location = var.location
}

module "network" {
  source                     = "./modules/network_module"
  rg_name                    = azurerm_resource_group.rg_root.name
  location                   = var.location
  nsg_01_name                = var.nsg_01_name
  vnet_01_name               = var.vnet_01_name
  subnet_01_name             = var.subnet_01_name
  vnet_01_address_space      = var.vnet_01_address_space
  subnet_01_address_prefixes = var.subnet_01_address_prefixes
}

module "storage_account" {
  source                       = "./modules/storage_account_module"
  rg_name                      = azurerm_resource_group.rg_root.name
  location                     = var.location
  sa_01_base_name              = var.sa_01_base_name
  sc_01_base_name              = var.sc_01_base_name
  amount_of_storage_containers = var.amount_of_storage_containers
}


module "key_vault" {
  source                       = "./modules/key_vault_module"
  rg_name                      = azurerm_resource_group.rg_root.name
  location                     = var.location
  kv_name                      = var.kv_name
  vm_username                  = var.vm_username
  vm_password                  = var.vm_password
  sa_access_key                = module.storage_account.sa_access_key
  kv_secret_username_name      = var.kv_secret_username_name
  kv_secret_password_name      = var.kv_secret_password_name
  kv_secret_sa_access_key_name = var.kv_secret_sa_access_key_name
  kv_sku                       = var.kv_sku
}

module "linux_vm" {
  source                  = "./modules/virtual_machine_module"
  rg_name                 = azurerm_resource_group.rg_root.name
  location                = var.location
  linux_vm_01_name        = var.linux_vm_01_name
  linux_vm_01_nic_name    = var.linux_vm_01_nic_name
  linux_vm_01_size        = var.linux_vm_01_size
  linux_vm_01_sku         = var.linux_vm_01_sku
  subnet_ID               = module.network.subnet_ID
  key_vault_id            = module.key_vault.kv_id
  kv_secret_username_name = module.key_vault.kv_secret_username_name
  kv_secret_password_name = module.key_vault.kv_secret_password_name
}

#