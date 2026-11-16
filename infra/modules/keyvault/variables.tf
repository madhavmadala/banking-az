variable "vault_name" {
  description = "Globally unique name for the Azure Key Vault."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group in which to create the Key Vault."
  type        = string
}

variable "location" {
  description = "Azure region for the Key Vault."
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant ID that owns the Key Vault."
  type        = string
}

variable "eventhub_connection_string" {
  description = "Listen-only connection string to store in Key Vault."
  type        = string
  sensitive   = true
}
