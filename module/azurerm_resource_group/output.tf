

output "resource_group" {
    value = [for rg in azurerm_resource_group.rg : rg.name]
  
}