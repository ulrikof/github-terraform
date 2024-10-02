variable "subscription_id" {
  type        = string
  description = "ID of subscription required by newer versions of Azure in terraform"
}

variable "rg_name" {
  type        = string
  description = "Name of root resource group"
}

variable "location" {
  type        = string
  description = "Location of resources"
}

# Variables for the network module
variable "nsg_01_name" {
  type        = string
  description = "The name of nsg 01"
}

variable "vnet_01_name" {
  type        = string
  description = "The name of virtual network 01"
}

variable "subnet_01_name" {
  type        = string
  description = "The name of subnet 01"
}

variable "vnet_01_address_space" {
  type        = list(string)
  description = "Address space for vnet 01"
}

variable "subnet_01_address_prefixes" {
  type        = list(string)
  description = "Prefixes for subnet 01"
}


# Variables for the storage account module
variable "sa_01_base_name" {
  type        = string
  description = "Base name of storage account 01"
}

variable "sc_01_base_name" {
  type        = string
  description = "Base name of storage container 01"
}

variable "amount_of_storage_containers" {
  type        = number
  description = "Specifies the amount of storage containers which is created within the storage account"
}

# Variables for the linux VM module
variable "linux_vm_01_name" {
  type        = string
  description = "Name of linux VM 01"
}

variable "linux_vm_01_nic_name" {
  type        = string
  description = "Name of NIC used by linux VM 01"
}

variable "linux_vm_01_sku" {
  type        = string
  description = "Describes the SKU for linux VM 01"
}

variable "linux_vm_01_size" {
  type        = string
  description = "Describes the size of linux VM 01"
}

# Variables for the key vault module
variable "kv_name" {
  type        = string
  description = "Name of the key vault"
}

variable "kv_sku" {
  type        = string
  description = "type of SKU for the key vault"
}

variable "vm_username" {
  type        = string
  description = "Username for VM"
}

variable "vm_password" {
  type        = string
  description = "Password for VM"
}

variable "kv_secret_username_name" {
  type        = string
  description = "Name of the secret that stores the admin username in the key vault"
}

variable "kv_secret_password_name" {
  type        = string
  description = "Name of the secret that stores the admin password in the key vault"
}

variable "kv_secret_sa_access_key_name" {
  type        = string
  description = "Name of secret where the storage account access key is stored"
}