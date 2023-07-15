resource "random_string" "postfix" {
  length  = 8
  special = false
  upper   = false
}

resource "azurerm_resource_group" "my_first_rg" {
  name     = "${var.resource_group_name}-${random_string.postfix.result}"
  location = var.location

  tags = var.tags
}
