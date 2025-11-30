variable "pip_info" {
    description = "public ips arguments to create Public Ip Generic Module"
    type = map(object({

    pip_name = string
    resource_group_name = string
    location = string
    allocation_method = string # Static or Dynamic 
    tags = map(string)

    # Optional Arguments 
    ddos_protection_mode = optional(string,"Disabled")
    ddos_protection_plan_id = optional(string)
                 ip_version = optional(string,"IPv4")

    }))

  
}