
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
//for_each wih set
locals {
  departments = ["hr","tech","admin"]
  environment = "dev"
  business_unit = "banking"
  department = "hr"
  resource_prefix = "${environment}-${business_unit}-${department}"
}

resource "azurerm_resource_group" "my_first_rg" {
  for_each = toset(local.departments)
  name     = "${local.resource_prefix}-training_rg-${each.key}"
  location = "West US"

  tags = {
    environment = "Dev"
    department  = "${each.value}"
  }
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
  #count = 3
  #depends_on = [ random_string.myrandom ]
  #name     = "training_rg-${random_string.myrandom.id}"
  #name     = "training_rg-${count.index}"
  name     = "training_rg"
  location = "West US"

  lifecycle {
    create_before_destroy = true
    prevent_destroy = true
    ignore_changes = [ tags ]
  }

  tags = {
    environment = "Dev"
  }
}
*/

