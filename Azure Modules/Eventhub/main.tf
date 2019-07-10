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

resource "azurerm_eventhub" "test2" {
  name                = var.name2
  namespace_name      = azurerm_eventhub_namespace.Evhub.name
  resource_group_name = data.azurerm_resource_group.hosting.name
  message_retention   = var.messageRetentionInDays
  partition_count     = 2
}

