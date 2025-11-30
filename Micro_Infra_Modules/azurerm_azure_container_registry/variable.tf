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