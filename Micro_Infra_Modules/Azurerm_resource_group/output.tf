output "rg_name" {
  value = { for k, rg in azurerm_resource_group.rg : k => rg.name }
}