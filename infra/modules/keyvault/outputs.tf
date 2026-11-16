output "vault_name" {
  description = "Name of the Key Vault."
  value       = azurerm_key_vault.this.name
}

output "key_vault_id" {
  description = "ID of the Key Vault."
  value       = azurerm_key_vault.this.id
}

output "eventhub_secret_uri" {
  description = "Versionless URI of the Event Hub connection string secret."
  value       = azurerm_key_vault_secret.eventhub_connection.versionless_id
}
