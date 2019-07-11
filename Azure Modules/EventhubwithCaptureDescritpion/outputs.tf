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

output "consumer_group_name_id" {
  description = "The EventHub Consumer Group ID."
  value       = "${azurerm_eventhub_consumer_group.ehub_consumer_group.id}"
}

output "consumer_group_name" {
  description = "The EventHub Consumer Group name associated with this event hub"
  value       = "${azurerm_eventhub_consumer_group.ehub_consumer_group.name}"
}