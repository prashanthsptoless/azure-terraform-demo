resource azurerm_subnet_network_security_group_association module_subnet_nsg_association {
  subnet_id                     = var.subnet_id
  network_security_group_id     = var.network_security_group_id
}