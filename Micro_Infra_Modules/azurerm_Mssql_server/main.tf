
data "azurerm_client_config" "current" {}

resource "azurerm_user_assigned_identity" "mi" {
  for_each            = var.sql_server
  name                = each.value.user_mi_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}


# here we have 2 types of login, 1 adminuser_name & admin_password to login server
# secure access via managed identity

resource "azurerm_mssql_server" "sqlserver" {
  for_each                     = var.sql_server
  name                         = each.value.sql_server_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  minimum_tls_version          = each.value.minimum_tls_version

  primary_user_assigned_identity_id            = azurerm_user_assigned_identity.mi[each.key].id
  #transparent_data_encryption_key_vault_key_id = azurerm_key_vault_key.example.id


  azuread_administrator {
    login_username = azurerm_user_assigned_identity.mi[each.key].name
    object_id      = azurerm_user_assigned_identity.mi[each.key].principal_id
  }

  identity {
    type         = each.value.identity_name
    identity_ids = [azurerm_user_assigned_identity.mi[each.key].id]
  }

}


