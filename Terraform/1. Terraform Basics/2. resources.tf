
/*
resource "azurerm_resource_group" "my_first_rg" {

  #depends_on = [ random_string.myrandom ]

  #name     = "demo_rg-${random_string.myrandom.id}"
  
  count = 3
  name  = "training_${count.index}-rg"

  #name     = "demo_rg"
  location = "West US"

  tags = {
    environment = "Tech"
  }
}

/*
# Random String Resource
resource "random_string" "myrandom" {
  length = 6
  upper = false 
  special = false
  numeric = false   
}
*/

/*
// A Set
// 1. Can't have duplicate elements
// 2. you cant't access elements using indexes
//for_each wih set
locals {
  departments = ["hr","tech","admin"]    # by default it is a list
  tags = {
    environment = "Dev"
    cost_center = "value"
  }
  environment = "dev"
  business_unit = "banking"
  department = "hr"
  resource_prefix = "${local.environment}-${local.business_unit}-${local.department}"
}

resource "azurerm_resource_group" "my_first_rg" {
  for_each = toset(local.departments)
  name     = "${local.resource_prefix}-training_rg-${each.key}"
  #name     = "training_rg-${each.key}"
  location = "West US"

  tags = merge(local.tags,{department  = "${each.value}"})
}

resource "azurerm_resource_group" "my_second_rg" {
  name     = "${local.resource_prefix}-demo_rg"
  #name     = "training_rg-${each.key}"
  location = "West US"

  tags = local.tags
}
*/

/*
//for_each wih map
locals {
  departments = {
    hr   = "Human Resources"
    tech = "Technology"
    admin= "Administration"
  }
}

resource "azurerm_resource_group" "my_first_rg" {
  for_each = local.departments
  name     = "training_rg-${each.key}"
  location = "West US"

  tags = {
    environment = "Dev"
    department  = "${each.value}"
  }
}
*/

/*
// Life cycles
resource "azurerm_resource_group" "my_first_rg" {
  name     = "training_rg_11"
  location = "West US"

  lifecycle {
    create_before_destroy = true
    #prevent_destroy = true
    #ignore_changes = [ tags ]
  }

  tags = {
    environment = "Dev"
  }
}
*/

