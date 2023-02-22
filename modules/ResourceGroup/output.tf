output output_resource_group_name {
  description = "Resource Group Name"
  value = azurerm_resource_group.module_resource_group.name 
}

output output_resource_group_id {
  description = "Resource Group ID"
  value = azurerm_resource_group.module_resource_group.id 
}

output output_resource_group_location {
  description = "Resource Group location"
  value = azurerm_resource_group.module_resource_group.location 
}