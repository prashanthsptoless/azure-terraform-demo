output output_subnet_id {
  description       = "newly created subnet id"
  value             = azurerm_subnet.module_subnet.*.id 
}

output output_vnet_id {
  description       = "newly created vnet id"
  value             = azurerm_virtual_network.module_virtual_network.id 
}

output output_vnet_name {
  description       = "newly created vnet name"
  value             = azurerm_virtual_network.module_virtual_network.name 
}

output output_vnet_rgname {
  description       = "newly created vnet rg name"
  value             = azurerm_virtual_network.module_virtual_network.resource_group_name 
}

output output_vnet_location {
  description       = "newly created vnet rg location"
  value             = azurerm_virtual_network.module_virtual_network.location
}

output output_vnet_address_space {
  description       = "newly created vnet address space"
  value             = azurerm_virtual_network.module_virtual_network.address_space 
}
