output "resource_group_name" {
  description = "Name of the development resource group."
  value       = module.network.resource_group_name
}

output "aks_cluster_name" {
  description = "Name of the development AKS cluster."
  value       = module.aks.cluster_name
}

output "acr_login_server" {
  description = "Login server hostname for the development container registry."
  value       = module.aks.acr_login_server
}

output "eventhub_namespace_name" {
  description = "Name of the development Event Hubs namespace."
  value       = module.eventhub.namespace_name
}

output "key_vault_name" {
  description = "Name of the development Key Vault."
  value       = module.keyvault.vault_name
}

