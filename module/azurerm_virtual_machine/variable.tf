variable "vms" {
  type = map(object({
    nic_name               = string
    location               = string
    resource_group_name    = string
    subnet_name            = string
    virtual_network_name   = string
    vm_name                = string
    size                   = string
    admin_username         = string
    admin_password         = string
    os_disk                = map(string)
    source_image_reference = map(string)
    admin_ssh_key = optional(map(string)
  ) }))

}
