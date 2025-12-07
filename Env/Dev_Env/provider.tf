terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.54.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "yash-resource-group1"
    storage_account_name = "yashstorageaccount9872"
    container_name = "newcontainer11"
    key = "devacr.tfstate"
    
  }
}

provider "azurerm" {
  features {}
 subscription_id = "49c47d3a-ee46-467f-b8ac-06b906f03845"
}
