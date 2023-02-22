resource azurerm_network_security_group module_nsg {
  name                      = var.nsg_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
}

# locals { 
# nsgrules = {
   
#     rdp = {
#       name                       = "rdp"
#       priority                   = 100
#       direction                  = "Inbound"
#       access                     = "Allow"
#       protocol                   = "Tcp"
#       source_port_range          = "*"
#       destination_port_range    = "3389"
#       source_address_prefix      = "VirtualNetwork"
#       destination_address_prefix = "*"
#     }
 
#     sql = {
#       name                       = "sql"
#       priority                   = 101
#       direction                  = "Inbound"
#       access                     = "Allow"
#       protocol                   = "Tcp"
#       source_port_range          = "*"
#       destination_port_range     = "1433"
#       source_address_prefix      = "SqlManagement"
#       destination_address_prefix = "*"
#     }
 
#     http = {
#       name                       = "http"
#       priority                   = 201
#       direction                  = "Inbound"
#       access                     = "Allow"
#       protocol                   = "Tcp"
#       source_port_range          = "*"
#       destination_port_range     = "80"
#       source_address_prefix      = "*"
#       destination_address_prefix = "*"
#     }

#     https = {
#       name                       = "https"
#       priority                   = 301
#       direction                  = "Inbound"
#       access                     = "Allow"
#       protocol                   = "Tcp"
#       source_port_range          = "*"
#       destination_port_range     = "443"
#       source_address_prefix      = "*"
#       destination_address_prefix = "*"
#     }
#   }
 
# }

# resource "azurerm_network_security_rule" "nsgrules" {
#   for_each                    = local.nsgrules 
#   name                        = each.key
#   direction                   = each.value.direction
#   access                      = each.value.access
#   priority                    = each.value.priority
#   protocol                    = each.value.protocol
#   source_port_range           = each.value.source_port_range
#   destination_port_range      = each.value.destination_port_range
#   source_address_prefix       = each.value.source_address_prefix
#   destination_address_prefix  = each.value.destination_address_prefix
#   resource_group_name         = var.resource_group_name
#   network_security_group_name = azurerm_network_security_group.module_nsg.name
# }