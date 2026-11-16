# Development Environment

This root composes the network, AKS/ACR, Event Hubs, and Key Vault modules in
`eastus` by default. Names for globally unique Azure resources share a stable,
random suffix persisted in Terraform state.

The Event Hub connection string is stored as a Key Vault secret. The AKS
kubelet identity is granted the `Key Vault Secrets User` role on the vault.

## Prerequisites

- Terraform 1.3 or later and Azure CLI authentication (`az login`).
- An existing Azure Storage account/container for the Terraform backend. Use a
  dedicated, access-controlled account with storage encryption and blob locking.

The partial `azurerm` backend is configured at init time. For example, supply
the backend values from your approved environment (do not commit credentials or
backend configuration files):

```powershell
terraform init `
  -backend-config="resource_group_name=<state-resource-group>" `
  -backend-config="storage_account_name=<state-storage-account>" `
  -backend-config="container_name=<state-container>" `
  -backend-config="key=banking-dev.tfstate" `
  -backend-config="use_azuread_auth=true"
terraform plan
terraform apply
```

The state contains sensitive values, including the Event Hubs connection
string, and must remain in this protected remote backend. Do not output or
commit state, plan files, or connection strings.
