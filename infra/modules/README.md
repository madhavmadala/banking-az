# Terraform Modules

These modules use the `hashicorp/azurerm` provider. The environment root pins
the provider version; modules inherit that provider configuration.

| Module | Inputs | Outputs |
| --- | --- | --- |
| `network` | `name_prefix`, `location` | Resource group name/ID, virtual network ID, AKS subnet ID |
| `aks` | `name_prefix`, `acr_name`, `resource_group_name`, `location`, `aks_subnet_id` | Cluster name/ID, ACR name/login server |
| `eventhub` | `namespace_name`, `resource_group_name`, `location` | Namespace name, Event Hub name, sensitive listen-only connection string |
| `keyvault` | `vault_name`, `resource_group_name`, `location`, `tenant_id`, sensitive `eventhub_connection_string` | Vault name/ID, versionless Event Hub secret URI |
| `functions` | `name_prefix`, `function_app_name`, `storage_account_name`, `resource_group_name`, `location`, `eventhub_connection_secret_uri`, `managed_identity_id` | Function App name/ID, storage account name |

The network module owns the environment resource group. The AKS module grants
the cluster kubelet identity `AcrPull` on its registry. The Event Hubs module
creates a listen-only authorization rule scoped to the `transactions` hub.
The Key Vault module stores that connection string with RBAC authorization;
the Function App reads it through a Key Vault reference using its assigned
managed identity.
