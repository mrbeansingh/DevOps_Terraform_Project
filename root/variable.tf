variable "aks_k8s" {
  type = map(object({
    aks_name            = string
    location            = string
    resource_group_name = string
    dns_prefix          = string
    default_node_pool = map(object({
      node_pool_name = string
      node_count     = number
      vm_size        = string
    }))
    tags = map(string)

  }))

}

variable "rg" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))

}