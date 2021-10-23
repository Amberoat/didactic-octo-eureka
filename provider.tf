provider "azurerm" {
  features {}
  # subscription_id = var.subscription_id
  # client_id       = var.client_id
  # client_secret   = var.client_secret
  # tenant_id       = var.tenant_id
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
