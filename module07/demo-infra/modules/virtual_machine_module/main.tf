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
   # public_key = file("~/.ssh/id_rsa.pub")
   # Placeholder to resolve validate on github, should be replaced with a key that can be stored as a secret,
   # but as this is not the porpouse of this module the placeholder wil work to avoid errors.
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCzrD+rblzOuI1Vf9Z/ZfIDFrIklrKXMwOK/dl94iZZNOsYoPs8S8MpseQXbpTt/09Au7K5RrklvetjSlaIjtLensVMm5NAq/HYuwpwsRafdDZCf/e1ft/3IoWDVPLvzTmYdSRe3Id5huUQk0EM7JZqDmPpoe8t0rvtYosFDjh2paNXX5HelIgIfKuKYn6jIJVWcdsQwYKMxjIyqLFkxw6AOXRcykefGkaWMz8s2N65qw58ZtgR4r75oitHSxBxBa0ZvysbBWjP2FJt0fZISzTH3Po4VSDe6IPG2g0y35Z8GG6WvHKvD2FbU5YMR+UUI4H6EoFmwSdIFrPj3lTm+v9JtDe40keGt0wYCKyPnE5/ij80CDF3PkDYRI9wAA8DfdVxaVZOoB7npDCrFUEH7idtpEFmA6qP/c9hb3idyeq43xTrZW9FOxAZ6W18R2FE/7PaprefZK/x1emkRQvWhi9oLATWL1mF3y2lzNhr8QX15wZsEV7lrJnbnaRgeAt2KIDKloY+YvLBOr8TmEmHrdOTzXMseQATQiY2KOp2QnX9sp67IjipB30LP5Jo9DjMHZy1RPynK6xlpf1LP6F1bqfKCThFttsTQ7jVOpXPCllGIosY4078jqjC9418/C+0xfkM71mAprEJlPMvOL0rrJvzwBdMfrsQ1o4KtmWyu/q7/w== test-key@example.com"
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


