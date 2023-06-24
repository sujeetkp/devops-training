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


resource "azurerm_resource_group" "my_first_rg" {
  name     = "${var.resource_group_name}"
  location = var.location

  tags = var.tags
}

/*
resource "azurerm_resource_group" "my_first_rg" {
  name     = "${var.resource_group_details.resource_group_name}"
  location = var.resource_group_details.location

  tags = var.resource_group_details.tags
}
*/

/*
resource "azurerm_resource_group" "my_first_rg" {
  count = 3
  name     = "${var.resource_group_name}-${count.index}"
  location = var.location

  tags = var.tags
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
  name     = "${var.resource_group_name}-${each.key}"
  location = var.location

  tags = {
    environment = "Dev"
    department  = "${each.value}"
  }
}
*/

resource "azurerm_virtual_network" "my_vnet" {
  name                = "my-vnet"
  location            = azurerm_resource_group.my_first_rg.location
  resource_group_name = azurerm_resource_group.my_first_rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.example.id
  }

  tags = {
    environment = "Production"
  }
}