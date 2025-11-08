terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.51.0"
    }
  }

   backend "azurerm" {
    resource_group_name  = "jiturg1"
    storage_account_name = "jitustorage123"
    container_name       = "state-file-container"
    key                  = "vm.tfstate"
  }

  
}

provider "azurerm" {
  features {}
  subscription_id = "10faea19-035c-4025-9136-201ca3e88e6d"
}