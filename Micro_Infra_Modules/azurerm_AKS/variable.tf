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