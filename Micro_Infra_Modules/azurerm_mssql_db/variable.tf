variable "sql_db" {
  description = "attributes to create Generic database Module"

  type = map(object({
    sqldb_name          = string
    sql_server_name     = string
    resource_group_name = string
    location            = string

    collation      = optional(string)
    license_type   = optional(string, "BasePrice")
    max_size_gb    = optional(number, 2)
    read_scale     = optional(string) #  This property is only settable for Premium and Business Critical databases.
    sku_name       = optional(string)
    zone_redundant = optional(bool, false)
    enclave_type   = optional(string)
    tags           = map(string)
  }))
}
