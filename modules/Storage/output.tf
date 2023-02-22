output output_storage_account_id {
  description               = "storage account id"
  value                     = azurerm_storage_account.module_storage_account.id 
}

output output_storage_account_name {
  description               = "storage account id"
  value                     = azurerm_storage_account.module_storage_account.name 
}