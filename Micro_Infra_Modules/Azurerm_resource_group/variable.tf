variable "rginfo" {
  description = "variable info to create Resource Group as generic modules"
  type = map(object({
    resource_group_name = string
    location            = string
    tags                = map(string)
  }))

}
