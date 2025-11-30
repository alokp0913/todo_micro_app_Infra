variable "vnet_info"{

description = "variables info to create Vnet as Generic Module"
type = map(object({

vnet_name = string
location = string
resource_group_name = string
vnet_cidr = list(string)
dns_servers = optional(list(string))
tags = map(string)

subnet_info = optional(map(object({
      subnet_name = string
      subnet_cidr = list(string)

    })))


}))



}