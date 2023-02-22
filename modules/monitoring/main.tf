resource azurerm_log_analytics_workspace module_azurerm_log_analytics_workspace {
  name                = var.law_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.law_sku #"PerGB2018"
  retention_in_days   = var.law_days #30
}