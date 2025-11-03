resource "azurerm_mssql_database" "sql_data" {
  for_each     = var.sql_data
  name         = each.value.name
  server_id    = data.azurerm_mssql_server.data_server[each.key].id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type

  tags = each.value.tags
}


data "azurerm_mssql_server" "data_server" {
  for_each            = var.data_server
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}


output "id" {
  value = { for k, v in data.azurerm_mssql_server.data_server : k => v.id }
}
