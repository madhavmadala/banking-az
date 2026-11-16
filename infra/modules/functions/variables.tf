variable "name_prefix" {
  description = "Lowercase prefix used to name the function service plan."
  type        = string
}

variable "function_app_name" {
  description = "Globally unique name for the Linux Function App."
  type        = string
}

variable "storage_account_name" {
  description = "Globally unique lowercase alphanumeric name for the Function App storage account."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group in which to create the Function App resources."
  type        = string
}

variable "location" {
  description = "Azure region for the Function App resources."
  type        = string
}

variable "eventhub_connection_secret_uri" {
  description = "Versionless Key Vault URI of the transactions Event Hub connection string secret."
  type        = string
}

variable "managed_identity_id" {
  description = "ID of the user-assigned identity used by the Function App."
  type        = string
}
