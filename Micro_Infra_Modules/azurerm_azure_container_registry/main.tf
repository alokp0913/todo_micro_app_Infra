resource "azurerm_container_registry" "acr" {
    for_each = var.acr
  name                = each.value.acr_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = "Standard"
  admin_enabled       = each.value.public_network_access_enabled
  dynamic "georeplications" {
    for_each = each.value.georeplica == null ? {} : each.value.georeplica
    content {
      location                = georeplications.value.replicalocation
      zone_redundancy_enabled = georeplications.value.zone_redundancy_enabled
      tags                    = georeplications.value.tags
    }
    }
}