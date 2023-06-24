
resource "random_string" "postfix" {
  length  = 8
  special = false
  upper   = false
}

resource "azurerm_resource_group" "nsg_rg" {
  location = var.location
  name     = "${var.resource_group_name}${random_string.postfix.result}"
}

module "nsg" {

  source  = "Azure/network-security-group/azurerm"
  version = "4.1.0"
  
  resource_group_name = azurerm_resource_group.nsg_rg.name
  use_for_each        = var.use_for_each

  security_group_name = var.security_group_name

  predefined_rules = [
    {
      name     = "HTTPS"
      priority = 501
    },
  ]

  custom_rules               = var.custom_rules
  source_address_prefix      = var.source_address_prefix
  destination_address_prefix = var.destination_address_prefix
  tags                       = var.tags

  depends_on = [azurerm_resource_group.nsg_rg]
}

module "rg" {
  source = "./modules/azurerm-nsg"

  resource_group_name = "Test"
  location = "Central US"
  tags = {
    department = "HR"
  }
}