variable "name_prefix" {
  description = "Lowercase prefix used to name the resource group and network resources."
  type        = string
}

variable "location" {
  description = "Azure region for the network resources."
  type        = string
}
