resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnet_info
  name                = each.value.vnet_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.vnet_cidr
  dns_servers         = each.value.dns_servers
  tags                = each.value.tags

  dynamic "subnet" {
    for_each = each.value.subnet_info == null ? {} : each.value.subnet_info
    content {
      name             = subnet.value.subnet_name
      address_prefixes = subnet.value.subnet_cidr
    }

  }


}
