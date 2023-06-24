output "id" {
  value = data.azurerm_resource_group.rg.id
}

output "vnet_address_space" {
  value = azurerm_virtual_network.my_vnet.address_space
}
