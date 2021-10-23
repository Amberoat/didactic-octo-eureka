terraform {
  backend "remote" {
    organization = "amberone"

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
