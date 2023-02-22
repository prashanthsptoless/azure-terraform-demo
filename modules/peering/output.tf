output peerings {
    value       = { for peering in azurerm_virtual_network_peering.module_virtual_network_peering : peering.name => peering }
    description = "Blocks containing configuration of each peering."
  /*module.MODULE_NAME.peering["PEERING_NAME"].id*/
}