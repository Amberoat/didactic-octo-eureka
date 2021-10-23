resource "random_pet" "prefix" {}

resource "azurerm_resource_group" "playground_rg" {
  name     = "${random_pet.prefix.id}-rg"
  location = "Southeast Asia"

  tags = {
    environment = "playground"
  }
}

resource "azurerm_kubernetes_cluster" "playground_aks" {
  name                = "${random_pet.prefix.id}-aks"
  location            = azurerm_resource_group.playground_rg.location
  resource_group_name = azurerm_resource_group.playground_rg.name
  dns_prefix          = "${random_pet.prefix.id}-k8s"

  default_node_pool {
    name            = "default"
    node_count      = 4
    vm_size         = "Standard_B1s"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  role_based_access_control {
    enabled = true
  }

  tags = {
    environment = "playground"
  }
}
