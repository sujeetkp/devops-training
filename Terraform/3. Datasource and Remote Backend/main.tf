data "azurerm_resource_group" "rg" {
  name = "training_rg"
}

resource "azurerm_virtual_network" "my_vnet" {
  name                = "my-vnet"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  tags = {
    environment = "Production"
  }
}