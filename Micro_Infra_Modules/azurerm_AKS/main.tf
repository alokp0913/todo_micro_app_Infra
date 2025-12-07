


resource "azurerm_kubernetes_cluster" "aks" {
  for_each            = var.aks
  name                = each.value.aks_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = "exampleaks1"


  dynamic "default_node_pool" {
    for_each = each.value.nodepool
    content {
      name       = default_node_pool.value.pool_name
      node_count = default_node_pool.value.node_count
      vm_size    = "Standard_B4s"
    }


  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
