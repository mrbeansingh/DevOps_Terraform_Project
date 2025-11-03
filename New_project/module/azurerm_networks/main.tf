resource "azurerm_virtual_network" "virtu_n" {
  for_each            = var.vnet
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
  dns_servers         = each.value.dns_servers

  dynamic "ddos_protection_plan" {
    for_each = each.value.ddos_protection_plan == null ? {} : each.value.ddos_protection_plan
    content {
      id     = ddos_protection_plan.value.id
      enable = ddos_protection_plan.value.enable
    }
  }
  dynamic "subnet" {
    for_each = each.value.subnet
    content {
      name             = subnet.value.sub_name
      address_prefixes = subnet.value.address_prefix

    }

  }
  tags = each.value.tags
}



