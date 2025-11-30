terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.54.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "backend-rg001"
    storage_account_name = "backendstg001"
    container_name = "devstate"
    key = "devacr.tfstate"
    
  }
}

provider "azurerm" {
  features {}
  subscription_id = "2ee73fb1-cc35-48c5-960d-5327d2785dfa"
}