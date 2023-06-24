/*
//Splat Operator
output "resource_group_id" {
  value = azurerm_resource_group.my_first_rg[*].id
  #sensitive = true
}

/*
output "resource_group_id" {
  value = azurerm_resource_group.my_first_rg.*.id
  #sensitive = true
}
*/

/*
//Count - Loop in to collect map
output "resource_group_details" {
  value = { for count, rg in azurerm_resource_group.my_first_rg: count => rg.id }
  #sensitive = true
}
*/

//for_each - Loop in to collect map and list
output "resource_group_details" {
  value = { for key, rg in azurerm_resource_group.my_first_rg: key => rg.id }
  #sensitive = true
}

output "resource_group_ids" {
  value = [ for rg in azurerm_resource_group.my_first_rg: rg.id ]
  #sensitive = true
}