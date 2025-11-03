variable "networks" {
  type = map(object({
    name                           = string
    location                       = string
    resource_group_name            = string
    address_space                  = list(string)
    dns_servers                    = optional(list(string))
    private_endpoint_vnet_policies = optional(string)
    tags                           = optional(map(string))
    ddos_protection_plan_id        = optional(string)
    enable_ddos_protection         = optional(bool)
    enable_vm_protection           = optional(bool)
    subnets = map(object({
      name             = string
      address_prefixes = list(string)
    }))



  }))
}
