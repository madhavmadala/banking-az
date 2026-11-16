resource "random_string" "suffix" {
  length  = 8
  lower   = true
  upper   = false
  numeric = true
  special = false
}

locals {
  name_prefix = "banking-dev-${random_string.suffix.result}"
}

data "azurerm_client_config" "current" {}

module "network" {
  source      = "../../modules/network"
  name_prefix = local.name_prefix
  location    = var.location
}

module "aks" {
  source              = "../../modules/aks"
  name_prefix         = local.name_prefix
  acr_name            = "banking${random_string.suffix.result}acr"
  resource_group_name = module.network.resource_group_name
  location            = var.location
  aks_subnet_id       = module.network.aks_subnet_id
}

module "eventhub" {
  source              = "../../modules/eventhub"
  namespace_name      = "${local.name_prefix}-eh"
  resource_group_name = module.network.resource_group_name
  location            = var.location
}

module "keyvault" {
  source                     = "../../modules/keyvault"
  vault_name                 = "${local.name_prefix}-kv"
  resource_group_name        = module.network.resource_group_name
  location                   = var.location
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  eventhub_connection_string = module.eventhub.connection_string
}

resource "azurerm_role_assignment" "aks_keyvault_secrets_user" {
  scope                = module.keyvault.key_vault_id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = module.aks.kubelet_identity_object_id
}
