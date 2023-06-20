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
resource "azurerm_resource_group" "my_first_rg" {
  name     = "training_rg-${random_string.myrandom.id}"
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