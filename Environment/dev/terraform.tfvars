RG = {
  rg1 = {
    name       = "rg-abhay"
    location   = "eastus"
    managed_by = "terraform"

  }

}
stg = {
  stg1 = {
    name                     = "stg1abhaysingh1"
    resource_group_name      = "rg-abhay"
    location                 = "eastus"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}
networks = {
  ng1 = {
    name                = "vnet-1"
    location            = "eastus"
    resource_group_name = "rg-abhay"
    address_space       = ["10.0.0.0/24"]
    subnets = {
      sub1 = {
        name             = "subnet-1"
        address_prefixes = ["10.0.1.0/24"]
      }
      sub2 = {
        name             = "subnet-2"
        address_prefixes = ["10.0.2.0/24"]
      }

    }

  }
}

vms = {
  vm1 = {
    nic_name             = "vm-1-nic"
    location             = "eastus"
    resource_group_name  = "rg-abhay"
    subnet_name          = "subnet-1"
    virtual_network_name = "vnet-1"
    vm_name              = "frontend-vm"
    size                 = string
    admin_username       = "Nemuadmin@123"
    admin_password       = "nemuuseer"
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }

  }
}
