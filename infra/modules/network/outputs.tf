output "resource_group_name" {
  description = "Name of the resource group shared by the environment."
  value       = azurerm_resource_group.this.name
}

output "resource_group_id" {
  description = "ID of the resource group shared by the environment."
  value       = azurerm_resource_group.this.id
}

output "virtual_network_id" {
  description = "ID of the virtual network."
  value       = azurerm_virtual_network.this.id
}

output "aks_subnet_id" {
  description = "ID of the dedicated AKS subnet."
  value       = azurerm_subnet.aks.id
}
