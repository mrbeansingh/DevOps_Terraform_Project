output "public_ip" {
  value = { for k, v in azurerm_public_ip.lb_pip : k => v.id }
}

output "lb_name" {
  value = { for k, v in azurerm_lb.lb : k => v.name }
}