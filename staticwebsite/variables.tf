variable "rg_name" {
  type    = string
  default = "uo_rg_staticwebsite"
}

variable "location" {
  type    = string
  default = "westeurope"
}

variable "sa_name" {
  type    = string
  default = "uo1sa"
}

variable "source_content" {
  type    = string
  default = "<h1>Web page created with Terraform</h1>"
}
variable "index_document" {
  type = string
  default = "index.html"
}