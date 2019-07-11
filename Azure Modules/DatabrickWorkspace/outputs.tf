output "resource_group_name" {
  description = "Resource group name"
  value       = data.azurerm_resource_group.hosting.name
}

output "id" {
  value = "${azurerm_databricks_workspace.hosting.id}"
}

output "managed_resource_group_id" {
  value = "${azurerm_databricks_workspace.hosting.managed_resource_group_id}"
}

output "name" {
  value = "${azurerm_databricks_workspace.hosting.name}"
}

