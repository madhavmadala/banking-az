variable "name_prefix" {
  description = "Lowercase prefix used to name the AKS cluster."
  type        = string
}

variable "acr_name" {
  description = "Globally unique, lowercase alphanumeric name for the Azure Container Registry."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group in which to create the cluster and registry."
  type        = string
}

variable "location" {
  description = "Azure region for the cluster and registry."
  type        = string
}

variable "aks_subnet_id" {
  description = "ID of the dedicated subnet for AKS nodes."
  type        = string
}
