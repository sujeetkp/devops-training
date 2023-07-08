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
  /*
  backend "azurerm" {
    resource_group_name  = "Terraform-State"
    storage_account_name = "terraformstateazure01"
    container_name       = "tfstate-aks"
    key                  = "demo.tfstate"
  }
  */
  #backend "azurerm" {}
}

# Provider Block
provider "azurerm" {
 features {}          
}

//terraform init -backend-config=backend.config