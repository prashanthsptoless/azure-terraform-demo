resource azurerm_virtual_network module_virtual_network {
  name                      = var.vnet_name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  address_space             = var.addressspace

#   ddos_protection_plan {
#     id              = var.ddos 
#     enable          = false 
#   }
}

resource azurerm_subnet module_subnet{
  count                     = "${length(var.subnet_prefix)}"
  name                      = "${lookup(element(var.subnet_prefix, count.index), "name")}"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.module_virtual_network.name 
  address_prefixes          = ["${lookup(element(var.subnet_prefix, count.index), "ip")}"]
}