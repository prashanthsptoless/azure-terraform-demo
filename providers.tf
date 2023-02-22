# terraform {
#     required_version            = ">=1.0.11"
#     backend "azurerm" {
#         resource_group_name         = "terraformRG"
#         storage_account_name        = "tfstgacc"
#         container_name              = "tfcon01"
#         key                         = "lz.tfstate"
#         access_key                  = "pFhG+YcGmXM/4Eba+wnEXRmiiq7nDEHApvuVyax26DKI/4jQESpr9dR/IY05ZVeruAkRb8QAZ/0u+AStZfBMMw=="
# }
# }
# provider "azurerm" {
#     # The "feature" block is required for AzureRM provider 2.x.
#     # If you're using version 1.x, the "features" block is not allowed.
#     version = "=3.0.0"
#     features {}
# }


terraform {
  required_providers {
      azurerm = {
          source = "hashicorp/azurerm"
          version = "2.76.0"
      }
  }
}

provider "azurerm" {
  features{}
    subscription_id     = "b732bdf3-10bf-4ae2-8ffe-6ba5f2d77711"
    client_id           = "6cef9625-260b-4e48-862b-0052a8ffdaf1"
    tenant_id           = "b41b72d0-4e9f-4c26-8a69-f949f367c91d"
    client_secret       = "Vbf8Q~lJhsT_IWmHFNUWjcZCAuuB_Du6AaLpGb5T"
}