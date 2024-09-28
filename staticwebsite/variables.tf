variable "rg_name" {
  type    = string
  default = "uo_rg_staticwebsite"
}
<<<<<<< HEAD

=======
>>>>>>> dddd76d (deploy web)
variable "location" {
  type    = string
  default = "westeurope"
}

variable "sa_name" {
  type    = string
<<<<<<< HEAD
  default = "uosa"
=======
  default = "uo1sa"
}

variable "index_document" {
  type    = string
  default = "<h1>Web page created with Terraform</h1>"
>>>>>>> dddd76d (deploy web)
}

variable "source_content" {
  type    = string
<<<<<<< HEAD
  default = "<h1>Web page created with Terraform - CI/CD</h1>"
}
variable "index_document" {
  type = string
=======
>>>>>>> dddd76d (deploy web)
  default = "index.html"
}