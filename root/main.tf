module "rgss" {
    source = "../child/azurermresoure_group"
    rg = var.rg
  
}

module "clusetr" {
    depends_on = [ module.rgss ]
    source = "../child/azurerm_aks"
    aks_k8s = var.aks_k8s
  
}