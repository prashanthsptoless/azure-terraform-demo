solution                    =   "V&A Museums"
cloud                       =   "az"
env_prefix                  =   "prod"
businessunit                =   "technology_team"
#current_date                =   "timestamp()"
owner                       =   "VA"
subscription_prefix         =   "prod"
subscription_prefix1        =  "nonprod"
subscription_prefix2        =  "hub"
region_prefix               =   "uksouth"
ordinal_prefix              =   "01"
location                    =   "UK South"
app_name_prefix             =   "app"
account_tier                =   "Standard"
account_replication_type    =   "LRS"
hubaddressspace             =   ["10.200.0.0/16"]
prodaddressspace            =   ["10.201.0.0/16"]
nonprodaddressspace         =   ["10.202.0.0/16"]
hubsubnet_prefix               =   [
    {
        ip                  =   "10.200.254.0/24"
        name                =   "snet-gateway-01"
    },
    {
        ip                  =   "10.200.0.0/24"
        name                =   "snet-shardserv-01"
    },
    {
        ip                  =   "10.200.252.0/24"
        name                =   "snet-management-01"
    },
    {
        ip                  =   "10.200.250.0/24"
        name                =   "snet-firewall-01"
    },
    {
        ip                  =   "10.200.2.0/24"
        name                =   "snet-wafddos-01"
    }
]
prodsubnet_prefix           =   [
    {
        ip                  =   "10.201.0.0/24"
        name                =   "snet-mgmttier-01"
    },
    {
        ip                  =   "10.201.16.0/20"
        name                =   "snet-frontendtier-01"
    },
    {
        ip                  =   "10.201.32.0/20"
        name                =   "snet-backendtier-01"
    },
    {
        ip                  =   "10.201.2.0/23"
        name                =   "snet-datatier-01"
    }
]
nonprodsubnet_prefix        =   [
    {
        ip                  =   "10.202.0.0/24"
        name                =   "snet-mgmttier-01"
    },
    {
        ip                  =   "10.202.16.0/20"
        name                =   "snet-frontendtier-01"
    },
    {
        ip                  =   "10.202.32.0/20"
        name                =   "snet-apptier-01"
    },
    {
        ip                  =   "10.202.2.0/23"
        name                =   "snet-datatier-01"
    }
]

policy_name_prefix          = "iaas"
powershellscript            = ".\\nsg.ps1"