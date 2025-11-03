output "nic_details" {
  value = {
    for k, v in azurerm_network_interface.nic : k => {
      id                    = v.id
      ip_configuration_name = [for ip in v.ip_configuration : ip.name]
    }
  }
}
