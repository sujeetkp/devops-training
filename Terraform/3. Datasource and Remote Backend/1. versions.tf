terraform {
  required_version = ">=1.0.0"
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
    container_name       = "demo-state"
    key                  = "demo.tfstate"  # Terrafrom will create by its own
  }
  */

  backend "azurerm" {}
}

# Provider Block
provider "azurerm" {
 features {}          
}

//terraform init -backend-config=backend.config
//terrafrom force-unlock <lock_id>