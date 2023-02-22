resource azurerm_resource_group module_resource_group{
    name          = var.resource_group_name
    location      = var.location
    tags          = {
      requestor             = "Azure_shared_services@vam.ac.uk"
      Environment           = var.env_prefix
      #owner                 = var.owner
      #solution              = var.solution
      businessunit          = var.businessunit
      #creation_date         = "current_date"
  }
}