resource "azurerm_storage_account" "this" {
  name                            = var.storage_account_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  min_tls_version                 = "TLS1_2"
  https_traffic_only_enabled      = true
  allow_nested_items_to_be_public = false
}

resource "azurerm_service_plan" "this" {
  name                = "${var.name_prefix}-plan"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_function_app" "this" {
  name                            = var.function_app_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  service_plan_id                 = azurerm_service_plan.this.id
  storage_account_name            = azurerm_storage_account.this.name
  storage_account_access_key      = azurerm_storage_account.this.primary_access_key
  https_only                      = true
  functions_extension_version     = "~4"
  key_vault_reference_identity_id = var.managed_identity_id

  identity {
    type         = "UserAssigned"
    identity_ids = [var.managed_identity_id]
  }

  app_settings = {
    AzureWebJobsStorage         = azurerm_storage_account.this.primary_connection_string
    FUNCTIONS_WORKER_RUNTIME    = "python"
    EVENT_HUB_CONNECTION_STRING = "@Microsoft.KeyVault(SecretUri=${var.eventhub_connection_secret_uri})"
  }

  site_config {
    application_stack {
      python_version = "3.11"
    }
  }
}
