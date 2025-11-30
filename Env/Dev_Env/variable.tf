
variable "rginfo" {
  description = "variable info to create Resource Group as generic modules"
  type = map(object({
    resource_group_name = string
    location            = string
    tags                = map(string)
  }))

}

#--------------------Vnet_Info----------------#

variable "vnet_info" {

  description = "variables info to create Vnet as Generic Module"
  type = map(object({

    vnet_name           = string
    location            = string
    resource_group_name = string
    vnet_cidr           = list(string)
    dns_servers         = optional(list(string))
    tags                = map(string)

    subnet_info = optional(map(object({
      subnet_name = string
      subnet_cidr = list(string)

    })))


  }))

}
variable "pip_info" {
  description = "public ips arguments to create Public Ip Generic Module"
  type = map(object({

    pip_name            = string
    resource_group_name = string
    location            = string
    allocation_method   = string # Static or Dynamic 
    tags                = map(string)

    # Optional Arguments 
    ddos_protection_mode    = optional(string, "Disabled")
    ddos_protection_plan_id = optional(string)
    ip_version              = optional(string, "IPv4")

  }))


}





##-------------------SQL_server_-----------------##

variable "sql_server" {
  description = "Sql server details "
  type = map(object({

    sql_server_name              = string
    resource_group_name          = string
    location                     = string
    version                      = string
    user_mi_name                 = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string
    identity_name                = string

  }))

}


##----------------SQL_DB_------------------##

variable "sql_db" {
  description = "attributes to create Generic database Module"

  type = map(object({
    sqldb_name          = string
    sql_server_name     = string
    resource_group_name = string
    location            = string
    collation           = optional(string)
    license_type        = optional(string, "BasePrice")
    max_size_gb         = optional(number, 2)
    read_scale          = optional(string) #  This property is only settable for Premium and Business Critical databases.
    sku_name            = optional(string)
    zone_redundant      = optional(bool, false)
    enclave_type        = optional(string)
    tags                = map(string)
  }))
}



##-----------------ACR_info_-----------------##

variable "acr" {
    type = map(object({
      
      acr_name = string
      resource_group_name = string
      location = string
      tags = map(string)
      public_network_access_enabled = optional(bool,true)

      georeplica =optional(map(object({

        replicalocation = string
        zone_redundancy_enabled = bool
        tags = map(string)

      })))
      
      
        
    }))
  
}



##--------------------AKS--------------------##

variable "aks" {
    type = map(object({
      aks_name = string
      location = string
      resource_group_name = string
      acr_name = string

      nodepool = map(object({
        pool_name = string
        node_count = number

      })) 
    }))
  
}