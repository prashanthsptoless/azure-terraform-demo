#Backup RG
module backuprg {                
    source                      = "./modules/ResourceGroup"
    resource_group_name          = "${var.cloud}-rg-backup-${var.subscription_prefix}-${var.region_prefix}-${var.ordinal_prefix}"
    location                     = var.location
    solution                     = var.solution
    system                       = "backup"
    env_prefix                   = var.env_prefix
    businessunit                 = var.businessunit
    owner                        = var.owner
}
#networking RG
module networkrg {                
    source                      = "./modules/ResourceGroup"
    resource_group_name          = "${var.cloud}-rg-network-${var.subscription_prefix}-${var.region_prefix}-${var.ordinal_prefix}"
    location                     = var.location
    solution                     = var.solution
    system                       = "network"
    env_prefix                   = var.env_prefix
    businessunit                 = var.businessunit
    owner                        = var.owner
}
#Hub spoke management RG
module mgmtrg {
    source                       = "./modules/ResourceGroup"
    resource_group_name          = "${var.cloud}-rg-mgm-${var.subscription_prefix}-${var.region_prefix}-${var.ordinal_prefix}"
    location                     = var.location
    solution                     = var.solution
    system                       = "virtual Network"
    env_prefix                   = var.env_prefix
    businessunit                 = var.businessunit
    owner                        = var.owner
}

#Hub vnet
module hubvirtual_network {
    source                       = "./modules/Vnet"
    vnet_name                    = "${var.cloud}-vnet-${var.region_prefix}-${var.subscription_prefix2}-${var.ordinal_prefix}"
    resource_group_name          = module.networkrg.output_resource_group_name
    location                     = module.networkrg.output_resource_group_location
    region_prefix                = var.region_prefix
    ordinal_prefix               = var.ordinal_prefix
    subscription_prefix          = var.subscription_prefix
    policy_name_prefix           = var.policy_name_prefix
    addressspace                 = var.hubaddressspace
    subnet_prefix                = var.hubsubnet_prefix           
}

#Prod Vnet
module prodvirtual_network {
    source                       = "./modules/Vnet"
    vnet_name                    = "${var.cloud}-vnet-${var.region_prefix}-${var.subscription_prefix}-${var.ordinal_prefix}"
    resource_group_name          = module.networkrg.output_resource_group_name
    location                     = module.networkrg.output_resource_group_location
    region_prefix                = var.region_prefix
    ordinal_prefix               = var.ordinal_prefix
    subscription_prefix          = var.subscription_prefix
    policy_name_prefix           = var.policy_name_prefix
    addressspace                 = var.prodaddressspace
    subnet_prefix                = var.prodsubnet_prefix           
}

#Non-prod Vnet
module nonprodvirtual_network {
    source                       = "./modules/Vnet"
    vnet_name                    = "${var.cloud}-vnet-${var.region_prefix}-${var.subscription_prefix1}-${var.ordinal_prefix}"
    resource_group_name          = module.networkrg.output_resource_group_name
    location                     = module.networkrg.output_resource_group_location
    region_prefix                = var.region_prefix
    ordinal_prefix               = var.ordinal_prefix
    subscription_prefix          = var.subscription_prefix
    policy_name_prefix           = var.policy_name_prefix
    addressspace                 = var.nonprodaddressspace
    subnet_prefix                = var.nonprodsubnet_prefix           
}


#shared RG
module sharedrg {                
    source                      = "./modules/ResourceGroup"
    resource_group_name          = "${var.cloud}-rg-shared-${var.subscription_prefix}-${var.region_prefix}-${var.ordinal_prefix}"
    location                     = var.location
    solution                     = var.solution
    system                       = "shared"
    env_prefix                   = var.env_prefix
    businessunit                 = var.businessunit
    owner                        = var.owner
}

#monitoring RG
module monitoringrg {                
    source                      = "./modules/ResourceGroup"
    resource_group_name          = "${var.cloud}-rg-monitor-${var.subscription_prefix}-${var.region_prefix}-${var.ordinal_prefix}"
    location                     = var.location
    solution                     = var.solution
    system                       = "monitoring"
    env_prefix                   = var.env_prefix
    businessunit                 = var.businessunit
    owner                        = var.owner
}

#storage under shared RG
module storage {
    source                       = "./modules/Storage"
    resource_group_name          = module.sharedrg.output_resource_group_name
    location                     = module.sharedrg.output_resource_group_location
    region_prefix                = var.region_prefix
    ordinal_prefix               = var.ordinal_prefix
    account_tier                 = var.account_tier
    account_replication_type     = var.account_replication_type
    env_prefix                   = var.env_prefix
    app_name_prefix              = var.app_name_prefix
    businessunit                 = var.businessunit
    solution                     = var.solution
    owner                        = var.owner
    cloud                        = var.cloud
    subscription_prefix1         = var.subscription_prefix1
}

#peering between hub and prod network
module hubtoprodvnet {
    source                      = "./modules/peering"
    resource_group_name         = module.hubvirtual_network.output_vnet_rgname
    vnet_name                   = module.hubvirtual_network.output_vnet_name
    peerings                    = [{ name = module.prodvirtual_network.output_vnet_name, remote_virtual_network_id = module.prodvirtual_network.output_vnet_id }]
}

#peering between prod to hub network
module prodtohubvnet {
    source                      = "./modules/peering"
    resource_group_name         = module.prodvirtual_network.output_vnet_rgname
    vnet_name                   = module.prodvirtual_network.output_vnet_name 
    peerings                    = [{ name = module.hubvirtual_network.output_vnet_name, remote_virtual_network_id = module.hubvirtual_network.output_vnet_id }]
}

#peering between hub and non prod network
module hubtononprodvnet {
    source                      = "./modules/peering"
    resource_group_name         = module.hubvirtual_network.output_vnet_rgname
    vnet_name                   = module.hubvirtual_network.output_vnet_name
    peerings                    = [{ name = module.nonprodvirtual_network.output_vnet_name, remote_virtual_network_id = module.nonprodvirtual_network.output_vnet_id }]
}

#peering between non prod to hub network
module nonprodtohubvnet {
    source                      = "./modules/peering"
    resource_group_name         = module.nonprodvirtual_network.output_vnet_rgname
    vnet_name                   = module.nonprodvirtual_network.output_vnet_name 
    peerings                    = [{ name = module.hubvirtual_network.output_vnet_name, remote_virtual_network_id = module.hubvirtual_network.output_vnet_id }]
}

#create log analytics
module monitoring {
    source                      = "./modules/monitoring"
    resource_group_name         = module.monitoringrg.output_resource_group_name
    location                    = module.monitoringrg.output_resource_group_location
    law_name                    = "loganalyproduks01"
    law_sku                     = "PerGB2018"
    law_days                    = "90"
}

#Hub vnet nsg
module hubnsg {
    source                      = "./modules/NSG"
    nsg_name                    = "${var.cloud}-nsg-appservice1-${var.ordinal_prefix}"
    resource_group_name         = module.networkrg.output_resource_group_name
    location                    = module.networkrg.output_resource_group_location
}

#Prod Vnet NSG
module prodnsg {
    source                      = "./modules/NSG"
    nsg_name                    = "${var.cloud}-nsg-appservice2-${var.ordinal_prefix}"
    resource_group_name         = module.networkrg.output_resource_group_name
    location                    = module.networkrg.output_resource_group_location
}

#Non-Prod NSG
module nonprodnsg {
    source                      = "./modules/NSG"
    nsg_name                    = "${var.cloud}-nsg-appservice3-${var.ordinal_prefix}"
    resource_group_name         = module.networkrg.output_resource_group_name
    location                    = module.networkrg.output_resource_group_location
}

#sql NSG
module sqlnsg {
    source                      = "./modules/NSG"
    nsg_name                    = "${var.cloud}-nsg-sql-${var.ordinal_prefix}"
    resource_group_name         = module.networkrg.output_resource_group_name
    location                    = module.networkrg.output_resource_group_location
}

#prod vnet NSG association
#-------------------------
module nsg_powershell {
    source                      = "./modules/powershell"
    powershellscript            = var.powershellscript
}

module nsg_association_appservice1 {
    source                      = "./modules/NSGAssociation"
    subnet_id                   = module.prodvirtual_network.output_subnet_id[0]
    network_security_group_id   = module.hubnsg.output_nsg_id 
}

module nsg_association_appservice2 {
    source                      = "./modules/NSGAssociation"
    subnet_id                   = module.prodvirtual_network.output_subnet_id[1]
    network_security_group_id   = module.prodnsg.output_nsg_id
}

module nsg_association_appservice3 {
    source                      = "./modules/NSGAssociation"
    subnet_id                   = module.prodvirtual_network.output_subnet_id[2]
    network_security_group_id   = module.nonprodnsg.output_nsg_id
}

module nsg_association_sql {
    source                      = "./modules/NSGAssociation"
    subnet_id                   = module.prodvirtual_network.output_subnet_id[3]
    network_security_group_id   = module.sqlnsg.output_nsg_id
}