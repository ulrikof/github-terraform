variable "subscription_id" {
  type        = string
  description = "ID of subscription required by newer versions of Azure in terraform"
  default = "30ee9279-e76e-409d-8973-00c9792f6bcb"
}

variable "rg_name" {
  type        = string
  description = "Name of root resource group"
  default = "uo-rg-root"
}

variable "location" {
  type        = string
  description = "Location of resources"
  default = "westeurope"
}

# Variables for the network module
variable "nsg_01_name" {
  type        = string
  description = "The name of nsg 01"
  default = "uo_NSG-01"
}

variable "vnet_01_name" {
  type        = string
  description = "The name of virtual network 01"
  default = "uo-vnet"
}

variable "subnet_01_name" {
  type        = string
  description = "The name of subnet 01"
  default = "uo-subnet-01"
}

variable "vnet_01_address_space" {
  type        = list(string)
  description = "Address space for vnet 01"
  default = ["10.0.0.0/16"]
}

variable "subnet_01_address_prefixes" {
  type        = list(string)
  description = "Prefixes for subnet 01"
  default = ["10.0.1.0/24"]
  }


# Variables for the storage account module
variable "sa_01_base_name" {
  type        = string
  description = "Base name of storage account 01"
  default = "uo1sa01"
}

variable "sc_01_base_name" {
  type        = string
  description = "Base name of storage container 01"
  default = "uo-sc"
}

variable "amount_of_storage_containers" {
  type        = number
  description = "Specifies the amount of storage containers which is created within the storage account"
  default = 3
}

# Variables for the linux VM module
variable "linux_vm_01_name" {
  type        = string
  description = "Name of linux VM 01"
  default = "uo-NIC-02"
}

variable "linux_vm_01_nic_name" {
  type        = string
  description = "Name of NIC used by linux VM 01"
  default = "uo-linux-vm-01"
}

variable "linux_vm_01_sku" {
  type        = string
  description = "Describes the SKU for linux VM 01"
  default = "22_04-lts"
}

variable "linux_vm_01_size" {
  type        = string
  description = "Describes the size of linux VM 01"
  default = "Standard_F2"
}

# Variables for the key vault module
variable "kv_name" {
  type        = string
  description = "Name of the key vault"
  default = "uo-key-vault-01"
}

variable "kv_sku" {
  type        = string
  description = "type of SKU for the key vault"
  default = "standard"
}

variable "vm_username" {
  type        = string
  description = "Username for VM"
  default = "uo_admin"
}

variable "vm_password" {
  type        = string
  description = "Password for VM"
  default = "Admin$Password1"
}

variable "kv_secret_username_name" {
  type        = string
  description = "Name of the secret that stores the admin username in the key vault"
  default = "vmUsername"
}

variable "kv_secret_password_name" {
  type        = string
  description = "Name of the secret that stores the admin password in the key vault"
  default = "vmPassword"
}

variable "kv_secret_sa_access_key_name" {
  type        = string
  description = "Name of secret where the storage account access key is stored"
  default = "saAccessKey"
}