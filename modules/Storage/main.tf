resource azurerm_storage_account module_storage_account {
  name                      = "${var.cloud}stg${var.region_prefix}${var.subscription_prefix1}${var.ordinal_prefix}"
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type

  tags          = {
      Environment           = var.env_prefix
      owner                 = var.owner
      solution              = var.solution
      businessunit          = var.businessunit
  }
}