variable "RG" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}
variable "stg" {
  type = map(object({
    # Required
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string

    # Optional attributes
    account_kind                      = optional(string)
    access_tier                       = optional(string)
    provisioned_billing_model_version = optional(string)
    cross_tenant_replication_enabled  = optional(bool)
    edge_zone                         = optional(string)
    https_traffic_only_enabled        = optional(bool)
    min_tls_version                   = optional(string)
    allow_nested_items_to_be_public   = optional(bool)
    shared_access_key_enabled         = optional(bool)
    public_network_access_enabled     = optional(bool)
    default_to_oauth_authentication   = optional(bool)
    is_hns_enabled                    = optional(bool)
    nfsv3_enabled                     = optional(bool)
    large_file_share_enabled          = optional(bool)
    local_user_enabled                = optional(bool)
    queue_encryption_key_type         = optional(string)
    table_encryption_key_type         = optional(string)
    infrastructure_encryption_enabled = optional(bool)
    sftp_enabled                      = optional(bool)
    dns_endpoint_type                 = optional(string)

    # Tags
    tags = optional(map(string))
  }))
}
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
    admin_ssh_key = optional(map(string)) 
    }))

}