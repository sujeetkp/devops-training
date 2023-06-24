# Terraform Block
terraform {
  required_version = "<=2.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.61.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

# Provider Block
provider "azurerm" {
 features {}          
}

/*
// depends_on and count
resource "azurerm_resource_group" "my_first_rg" {
  #count = 3
  #depends_on = [ random_string.myrandom ]
  #name     = "training_rg-${random_string.myrandom.id}"
  #name     = "training_rg-${count.index}"
  name     = "training_rg"
  location = "West US"

  tags = {
    environment = "Dev"
  }
}

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

