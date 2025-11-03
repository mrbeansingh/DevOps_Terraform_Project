variable "RGS" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}

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

variable "linux_vms" {
  type = map(object({
    nic_name            = string
    location            = string
    resource_group_name = string

    sub_name = string
    virtual_network_name= string
    vm_name= string
    size= string
    admin_username= string
    admin_password= string
    

  }))

}

