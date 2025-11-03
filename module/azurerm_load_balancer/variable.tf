variable "lb" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    frontend_ip_configuration = map(object({
      name                 = string
      public_ip_address_id = string
    }))


  }))

}
variable "public_lb" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
  }))

}


variable "backend_pool" {
  type = list(string)

}

variable "rule_lb" {
  type = map(object({
    loadbalancer_id                = string
    name                           = string
    protocol                       = string
    frontend_port                  = number
    backend_port                   = number
    frontend_ip_configuration_name = string
    backend_address_pool_ids       = string
    probe_id                       = string
    tags = map(object({
      name     = string
      value    = string
      resource = string
    }))
  }))

}

variable "lb_probe" {

  type = map(object({
    name = string
    port = number
  }))
}

variable "association" {
    type = map(object({
      name = string
      ip_configuration_name= string
       backend_address_pool_id = string
    }))
  
}
