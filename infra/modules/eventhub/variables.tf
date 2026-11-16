variable "namespace_name" {
  description = "Globally unique name for the Event Hubs namespace."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group in which to create Event Hubs."
  type        = string
}

variable "location" {
  description = "Azure region for the Event Hubs namespace."
  type        = string
}
