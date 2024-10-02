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

  admin_ssh_key {
    username   = data.azurerm_key_vault_secret.username.value
    public_key = file("~/.ssh/id_rsa.pub")
  }

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


