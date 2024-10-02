# Retrive the username of linux_vm_01 stored in the key vault
data "azurerm_key_vault_secret" "username" {
  name         = var.kv_secret_username_name
  key_vault_id = var.key_vault_id
}

# Retrive the password of linux_vm_01 stored in the key vault
data "azurerm_key_vault_secret" "password" {
  name         = var.kv_secret_password_name
  key_vault_id = var.key_vault_id
}

# NIC used by linux_vm_01
resource "azurerm_network_interface" "NIC_01" {
  name                = var.linux_vm_01_nic_name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_ID
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "linux_vm_01" {
  name                = var.linux_vm_01_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.linux_vm_01_size
  admin_username      = data.azurerm_key_vault_secret.username.value
  admin_password      = data.azurerm_key_vault_secret.password.value
  network_interface_ids = [
    azurerm_network_interface.NIC_01.id
  ]

  # admin_ssh_key {
    # username   = data.azurerm_key_vault_secret.username.value
   # public_key = file("~/.ssh/id_rsa.pub")
   # Placeholder to resolve validate on github, should be replaced with a key that can be stored as a secret,
   # but as this is not the porpouse of this module the placeholder wil work to avoid errors.
    # public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1z8R4X8Q8s1kl4/bAfX4e/rR0Y6C7r5sby77dXZ/F8N3AQO+o6B9q5T6F4Zw2I2pOvXT1W/gOjW1y8u5HwYfeX1szjxkksxsxfJZ5fJZbB2AXWfF4GlYppvS7W1x+FUpyZqH4FbzyA0JbjdrUBc7XHoMFkaIoKy5ogT8EZk+ZoEBZLOOi2AV/test-key@example.com"
  # }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = var.linux_vm_01_sku
    version   = "latest"
  }
}


