# data azurerm_resource_group mgmtrg{
#   name                              = "rg-mgm-${var.subscription_prefix}-${var.region_prefix}-${var.ordinal_prefix}"
# }

# data azurerm_virtual_network vnet1 {
#   name                              = "${var.vnet_names[0]}"
#   resource_group_name               = "${data.azurerm_resource_group.mgmtrg.name}"
# }

# data azurerm_virtual_network vnet2 {
#   name                              = "${var.vnet_names[1]}"
#   resource_group_name               = "${data.azurerm_resource_group.mgmtrg.name}"
# }

# data azurerm_virtual_network vnet3 {
#   name                              = "${var.vnet_names[2]}"
#   resource_group_name               = "${data.azurerm_resource_group.mgmtrg.name}"
# }

# resource "azurerm_virtual_network_peering" "vnet-peer-01" {
#   name                              = "${var.vnet_peering_names[0]}"
#   resource_group_name               = "${data.azurerm_resource_group.mgmtrg.name}"
#   virtual_network_name              = "${data.azurerm_virtual_network.vnet1.name}"
#   remote_virtual_network_id         = "${data.azurerm_virtual_network.vnet2.id}"
#   allow_virtual_network_access      = "${var.allow_virtual_network_access}"
#   allow_forwarded_traffic           = "${var.allow_forward_traffic}"
#   use_remote_gateways               = "${var.use_remote_gateways}"
# }

# resource "azurerm_virtual_network_peering" "vnet-peer-02" {
#   name                              = "${var.vnet_peering_names[1]}"
#   resource_group_name               = "${data.azurerm_resource_group.mgmtrg.name}"
#   virtual_network_name              = "${data.azurerm_virtual_network.vnet2.name}"
#   remote_virtual_network_id         = "${data.azurerm_virtual_network.vnet1.id}"
#   allow_virtual_network_access      = "${var.allow_virtual_network_access}"
#   allow_forwarded_traffic           = "${var.allow_forward_traffic}"
#   use_remote_gateways               = "${var.use_remote_gateways}"
# }

# resource "azurerm_virtual_network_peering" "vnet-peer-03" {
#   name                              = "${var.vnet_peering_names[2]}"
#   resource_group_name               = "${data.azurerm_resource_group.mgmtrg.name}"
#   virtual_network_name              = "${data.azurerm_virtual_network.vnet1.name}"
#   remote_virtual_network_id         = "${data.azurerm_virtual_network.vnet3.id}"
#   allow_virtual_network_access      = "${var.allow_virtual_network_access}"
#   allow_forwarded_traffic           = "${var.allow_forward_traffic}"
#   use_remote_gateways               = "${var.use_remote_gateways}"
# }

# resource "azurerm_virtual_network_peering" "vnet-peer-04" {
#   name                              = "${var.vnet_peering_names[3]}"
#   resource_group_name               = "${data.azurerm_resource_group.mgmtrg.name}"
#   virtual_network_name              = "${data.azurerm_virtual_network.vnet3.name}"
#   remote_virtual_network_id         = "${data.azurerm_virtual_network.vnet1.id}"
#   allow_virtual_network_access      = "${var.allow_virtual_network_access}"
#   allow_forwarded_traffic           = "${var.allow_forward_traffic}"
#   use_remote_gateways               = "${var.use_remote_gateways}"
# }

resource azurerm_virtual_network_peering module_virtual_network_peering {
    for_each                     = { for peering in var.peerings : peering.name => peering }
    name                         = each.value.name
    resource_group_name          = var.resource_group_name
    virtual_network_name         = var.vnet_name
    remote_virtual_network_id    = each.value.remote_virtual_network_id
    allow_virtual_network_access = lookup(each.value, "allow_virtual_network_access", true)
    allow_forwarded_traffic      = lookup(each.value, "allow_forwarded_traffic", true)
    allow_gateway_transit        = lookup(each.value, "allow_gateway_transit", false)
    use_remote_gateways          = lookup(each.value, "use_remote_gateways", false)
}