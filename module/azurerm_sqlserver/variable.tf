variable "mssql_server" {
  type = map(object({
    name                                         = string
    resource_group_name                          = string
    location                                     = string
    version                                      = string
    administrator_login                          = optional(string)
    administrator_login_password                 = optional(string)
    administrator_login_password_wo              = optional(string)
    administrator_login_password_wo_version      = optional(number)
    connection_policy                            = optional(string)
    express_vulnerability_assessment_enabled     = optional(bool)
    transparent_data_encryption_key_vault_key_id = optional(string)
    minimum_tls_version                          = optional(string)
    public_network_access_enabled                = optional(bool)
    outbound_network_restriction_enabled         = optional(bool)
    primary_user_assigned_identity_id            = optional(string)
    identity = optional(object({
      type         = string
      identity_ids = optional(list(string))
    }))
    azuread_administrator = optional(map(object({
      login_username              = string
      object_id                   = string
      tenant_id                   = optional(string)
      azuread_authentication_only = optional(bool)
    })))
    tags = optional(map(string))
    timeouts = optional(object({
      create = optional(string, "1h")
      read   = optional(string, "5m")
      update = optional(string, "1h")
      delete = optional(string, "1h")
    }))

  }))
}
