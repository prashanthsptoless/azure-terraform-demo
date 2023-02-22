output output_nsg_id{
  value             = azurerm_network_security_group.module_nsg.id 
  description       = "network security group id"
}