/*
resource "random_string" "postfix" {
  length  = 8
  special = false
  upper   = false
}

resource "azurerm_resource_group" "nsg_rg" {
  location = var.location
  name     = "${var.resource_group_name}${random_string.postfix.result}"
}

module "my-nsg" {

  source  = "Azure/network-security-group/azurerm"
  version = "4.1.0"
  
  resource_group_name = azurerm_resource_group.nsg_rg.name

  security_group_name = var.security_group_name
  tags                       = var.tags

  depends_on = [azurerm_resource_group.nsg_rg]
}
*/

module "my-rg" {
  source = "./modules/azurerm-rg"

  resource_group_name = "Test"
  location = "Central US"
  tags = {
    department = "HR"
  }
}