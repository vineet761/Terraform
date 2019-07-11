provider "azurerm"{
  version         = "~> 1.27"
  subscription_id = ""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
  
}

data "azurerm_resource_group" "hosting" {
  name = var.resource_group
}

resource "azurerm_eventhub_namespace" "Evhub" {
  name                = var.namespaceName
  location            = data.azurerm_resource_group.hosting.location
  resource_group_name = data.azurerm_resource_group.hosting.name
  sku                 = var.eventHubSku
  tags                = data.azurerm_resource_group.hosting.tags
  capacity            = 2
  kafka_enabled       = false
}

resource "azurerm_eventhub" "test" {
  name                = var.name
  namespace_name      = azurerm_eventhub_namespace.Evhub.name
  resource_group_name = data.azurerm_resource_group.hosting.name
  message_retention   = var.messageRetentionInDays
  partition_count     = 2
}

resource "azurerm_storage_account" "hosting" {
  resource_group_name           = data.azurerm_resource_group.hosting.name
  location                 = data.azurerm_resource_group.hosting.location
  name                     = var.sa_name
  account_replication_type = var.account_replication_type
  account_tier             = var.account_tier
  account_kind             = var.account_kind
  enable_https_traffic_only = true
  identity {
    type = "SystemAssigned"
  }

}

resource "azurerm_storage_container" "hosting" {
  name                  = "blobit"
  resource_group_name   = data.azurerm_resource_group.hosting.name
  storage_account_name  = azurerm_storage_account.hosting.name
  container_access_type = "blob"
}


resource "azurerm_eventhub_consumer_group" "ehub_consumer_group" {
  name                = "${var.consumer_group_name}"
  namespace_name      = "${azurerm_eventhub_namespace.Evhub.name}"
  eventhub_name       = "${azurerm_eventhub.test.name}"
  user_metadata       =  var.consumer_group_user_metadata
  resource_group_name = data.azurerm_resource_group.hosting.name
}

resource "azurerm_storage_blob" "testsb" {
  name                   = "storageblob"
  resource_group_name    = data.azurerm_resource_group.hosting.name
  storage_account_name   = azurerm_storage_account.hosting.name
  storage_container_name = azurerm_storage_container.hosting.name
  type                   = "block"
  size                   = 5120
}