resource "azurerm_public_ip" "lb_pip" {
  for_each            = var.public_lb
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
}
resource "azurerm_lb" "lb" {
  for_each            = var.lb
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "frontend_ip_configuration" {
    for_each = each.value.frontend_ip_configuration
    content {
      name                 = frontend_ip_configuration.value.name
      public_ip_address_id = azurerm_public_ip.lb_pip[frontend_ip_configuration.value.public_ip_address_id].id

    }

  }
}

resource "azurerm_lb_backend_address_pool" "b_pool" {
  for_each        = var.backend_pool
  loadbalancer_id = azurerm_lb.lb.id
  name            = each.value.name
}

resource "azurerm_lb_rule" "lb_rule" {
  for_each                       = var.rule_lb
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = each.value.name
  protocol                       = each.value.protocol
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
  backend_address_pool_ids       = each.value.backend_address_pool_ids
  probe_id                       = azurerm_lb_probe.h_probe.id
}

resource "azurerm_lb_probe" "h_probe" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = each.value.name
  port            = each.value.port
}

resource "azurerm_network_interface_backend_address_pool_association" "example" {
    for_each = var.association

  network_interface_id    = each.value.network_interface_id
  ip_configuration_name   = each.value.ip_configuration_name
  backend_address_pool_id = azurerm_lb_backend_address_pool.b_pool.id
}

