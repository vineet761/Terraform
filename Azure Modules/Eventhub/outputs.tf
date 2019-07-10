output "resource_group_name" {
  description = "Resource group name"
  value       = data.azurerm_resource_group.hosting.name
}

output "ID" {
  value = azurerm_eventhub.test.id
}

output "pID" {
  value = azurerm_eventhub.test.partition_ids
}

