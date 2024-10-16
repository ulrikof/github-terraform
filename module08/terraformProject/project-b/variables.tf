# Variables for the main configuration
variable "resource_group_name" {
  type        = string
  default     = "uo-rg-demo-project-b"
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "The location of the storage account"
}

variable "storage_account_name" {
  type        = string
  default     = "uosademo12364s" 
  description = "The name of the storage account"
}