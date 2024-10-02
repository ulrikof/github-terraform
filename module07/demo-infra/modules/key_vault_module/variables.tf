variable "rg_name" {
  type        = string
  description = "The name of the root resource group"
}

variable "location" {
  type        = string
  description = "The location/region of the resource group"
}

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

variable "sa_access_key" {
  type        = string
  description = "Access key for storage account"
}

variable "kv_secret_username_name" {
  type        = string
  description = "Name of secret where the username of the VM is stored"
}

variable "kv_secret_password_name" {
  type        = string
  description = "Name of secret where the password of the VM is stored"
}

variable "kv_secret_sa_access_key_name" {
  type        = string
  description = "Name of secret where the storage account access key is stored"
}