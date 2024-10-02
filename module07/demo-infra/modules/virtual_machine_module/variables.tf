variable "rg_name" {
  type        = string
  description = "The name of the root resource group"
}

variable "location" {
  type        = string
  description = "The location/region of the resource group"
}

variable "linux_vm_01_nic_name" {
  type        = string
  description = "Name of NIC used by linux VM 01"
}

variable "subnet_ID" {
  type        = string
  description = "ID of subnet where the VM is placed"
}

variable "linux_vm_01_name" {
  type        = string
  description = "Name of linux vm 01"
}

variable "key_vault_id" {
  type        = string
  description = "ID of key vault where credentials for the VM is stored "
}

variable "kv_secret_username_name" {
  type        = string
  description = "Name of secret where the username of the VM is stored"
}

variable "kv_secret_password_name" {
  type        = string
  description = "Name of secret where the password of the VM is stored"
}

variable "linux_vm_01_sku" {
  type        = string
  description = "Describes the SKU for linux VM 01"
}

variable "linux_vm_01_size" {
  type        = string
  description = "Describes the size of linux VM 01"
}