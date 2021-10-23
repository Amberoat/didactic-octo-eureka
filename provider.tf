terraform {
  backend "remote" {
    organization = "amberone"
    resource_group_name  = "rg-azure-tf"
    storage_account_name = "saseaazuretf"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"

    workspaces {
      name = "didactic-octo-eureka"
    }
  }

  required_providers {
    azurerm = {
      version = "~>2.0"
    }
  }
}
