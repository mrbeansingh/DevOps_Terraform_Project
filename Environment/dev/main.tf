module "resource_group_name" {
  source = "../../module/azurerm_resource_group"
  RG     = var.RG

}


module "stg" {
  source = "../../module/azurerm_storage_account"
  stg    = var.stg

}

module "netwroking" {
  depends_on = [module.resource_group_name]
  source     = "../../module/azurerm_networks"
  networks   = var.networks

}
module "vms" {
  depends_on = [module.netwroking]
  source     = "../../module/azurerm_virtual_machine"
  vms        = var.vms

}
output "nic" {
  value = module.vms.nic_details

}

# module "sql_server" {
#   source       = "../../module/azurerm_sqlserver"
#   mssql_server = var.mssql_server

# }
# module "sql_data" {
#   depends_on  = [module.sql_server]
#   source      = "../../module/azurerm_sql_database"
#   sql_data    = var.sql_data
#   data_server = var.data_server

# }

