data "azurerm_mssql_server" "sqlserver" {
  for_each            = var.sql_db
  name                = each.value.sql_server_name
  resource_group_name = each.value.resource_group_name
}



resource "azurerm_mssql_database" "example" {

  for_each       = var.sql_db

  name           = each.value.sqldb_name
  server_id      = data.azurerm_mssql_server.sqlserver[each.key].id
  collation      = each.value.collation
  license_type   = each.value.license_type
  max_size_gb    = each.value.max_size_gb
  read_scale     = each.value.read_scale
  sku_name       = each.value.sku_name
  zone_redundant = each.value.zone_redundant
  enclave_type   = each.value.enclave_type
  tags           = each.value.tags

  #   identity {
  #     type         = "UserAssigned"
  #     identity_ids = [azurerm_user_assigned_identity.example.id]
  #   }

  #   transparent_data_encryption_key_vault_key_id = azurerm_key_vault_key.example.id

  # prevent the possibility of accidental data loss
  #   lifecycle {
  #     prevent_destroy = true
  #   }
}
