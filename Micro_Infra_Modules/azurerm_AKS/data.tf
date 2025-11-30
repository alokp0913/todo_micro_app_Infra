data "azurerm_container_registry" "acr" {
  for_each            = var.aks
  name                = each.value.acr_name
  resource_group_name = each.value.resource_group_name
}

# output "login_server" {
#   value = data.azurerm_container_registry.acr[0].login_server
# }

resource "azurerm_role_assignment" "aks_acr_pull" {
  for_each            = var.aks
  scope                = data.azurerm_container_registry.acr[each.key].id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks[each.key].kubelet_identity[0].object_id
}
