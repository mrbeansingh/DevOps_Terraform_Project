module "resource_group" {
  source = "../module/azurerm_resource_group"
  RGS    = var.RGS

}

module "net" {
  depends_on = [ module.resource_group ]
  source = "../module/azurerm_networks"
  vnet   = var.vnet
}

module "vVM" {
  depends_on = [ module.net]
    source = "../module/azurerm_virtual_machine"
    
  linux_vms = var.linux_vms
}

