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
  source                   = "terraform.hosting.maersk.com/tsoe/terraform-azure-storage-account/azure"
  resource_group           = "${module.environment.resource_group_name}"
  sa_name                  = "${var.sa_name}"
  account_replication_type = "${var.account_replication_type}"
  account_tier             = "${var.account_tier}"
  account_kind             = "${var.account_kind}"

}


resource "azurerm_eventhub_consumer_group" "ehub_consumer_group" {
  
  name                = "${var.consumer_group_name}"
  namespace_name      = "${azurerm_eventhub_namespace.Evhub.name}"
  eventhub_name       = "${azurerm_eventhub.test.name}"
  user_metadata       =  var.consumer_group_user_metadata
  resource_group_name = data.azurerm_resource_group.hosting.name
}
