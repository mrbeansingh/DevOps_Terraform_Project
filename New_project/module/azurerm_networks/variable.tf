
variable "vnet" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    dns_servers         = optional(list(string))
    ddos_protection_plan = optional(map(object({
      id     = string
      enable = bool
    })))
    subnet = map(object({
      sub_name         = string
      address_prefix = list(string)
    }))
    tags = map(string)

  }))

}

