output "function_app_name" {
  description = "Name of the Linux Function App."
  value       = azurerm_linux_function_app.this.name
}

output "function_app_id" {
  description = "ID of the Linux Function App."
  value       = azurerm_linux_function_app.this.id
}

output "storage_account_name" {
  description = "Name of the Function App storage account."
  value       = azurerm_storage_account.this.name
}

