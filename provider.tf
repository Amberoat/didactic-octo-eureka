provider "azurerm" {
  features {}
}

terraform {
  backend "remote" {
    # resource_group_name  = "rg-azure-tf"
    # storage_account_name = "saseaazuretf"
    # container_name       = "terraform-state"
    # key                  = "terraform.tfstate"
    organization = "amberone"

    workspaces {
      name = "didactic-octo-eureka"
    }

  }

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}
