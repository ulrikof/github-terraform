# NSG used by subnet_01
resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_01_name
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_virtual_network" "vnet_01" {
  name                = var.vnet_01_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.vnet_01_address_space
}

resource "azurerm_subnet" "subnet_01" {
  name                 = var.subnet_01_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet_01.name
  address_prefixes     = var.subnet_01_address_prefixes
}

resource "azurerm_subnet_network_security_group_association" "subnet_to_nsg" {
  subnet_id                 = azurerm_subnet.subnet_01.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}