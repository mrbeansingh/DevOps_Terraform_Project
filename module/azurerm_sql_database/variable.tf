variable "sql_data" {
  type = map(object({

    name         = string
    server_id    = optional(number)
    collation    = string
    license_type = string
    max_size_gb  = number
    sku_name     = string
    enclave_type = string

    tags = optional(map(string))
  }))

}

variable "data_server" {
  type = map(object({
    name                = string
    resource_group_name = string
  }))
}
