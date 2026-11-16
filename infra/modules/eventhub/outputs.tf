output "namespace_name" {
  description = "Name of the Event Hubs namespace."
  value       = azurerm_eventhub_namespace.this.name
}

output "eventhub_name" {
  description = "Name of the transactions Event Hub."
  value       = azurerm_eventhub.transactions.name
}

output "connection_string" {
  description = "Listen-only connection string scoped to the transactions Event Hub."
  value       = azurerm_eventhub_authorization_rule.transactions_listen.primary_connection_string
  sensitive   = true
}
