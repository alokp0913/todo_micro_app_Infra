variable "sql_server" {
  description = "Sql server details "
  type = map(object({

    sql_server_name     = string
    resource_group_name = string
    location            = string
    version = string
    user_mi_name = string
    administrator_login = string
    administrator_login_password = string
    minimum_tls_version = string
    identity_name = string

  }))

}
