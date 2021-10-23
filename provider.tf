provider "azurerm" {
  features {}
}

terraform {
  backend "default" {
    resource_group_name  = "rg-azure-tf"
    storage_account_name = "saseaazuretf"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}
