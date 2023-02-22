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
    subscription_id     = "1a03097d-acea-4652-9359-ee20a58c6383"
    client_id           = "b14c84cd-2f24-4632-aa38-817b1b4065d0"
    tenant_id           = "e8297bd2-7420-41c8-8f42-2ee1d08be009"
    client_secret       = "PY68Q~5vxleD7FQCYTbMpFtQP6uJbcJhIf1QRc0k"
}
