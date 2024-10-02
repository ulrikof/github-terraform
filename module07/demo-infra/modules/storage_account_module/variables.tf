variable "rg_name" {
  type        = string
  description = "The name of the root resource group"
}

variable "location" {
  type        = string
  description = "The location/region of the resource group"
}

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