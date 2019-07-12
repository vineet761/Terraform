provider "azurerm"{
  version         = "~> 1.27"
  subscription_id = ""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
  
}
ata "azurerm_resource_group" "hosting" {
  name = var.resource_group
}

resource "azurerm_databricks_workspace" "hosting" {
  name                        = var.name
  location                    = data.azurerm_resource_group.hosting.location
  resource_group_name         = data.azurerm_resource_group.hosting.name
  sku                         = var.sku
 
  tags                        = var.custom_tags
}
