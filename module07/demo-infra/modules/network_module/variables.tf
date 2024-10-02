variable "rg_name" {
  type        = string
  description = "The name of the root resource group"
}

variable "location" {
  type        = string
  description = "The location/region of the resource group"
}

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

