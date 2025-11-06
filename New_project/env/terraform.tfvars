RGS = {
  rg1 = {
    name     = "raj-rg"
    location = "eastus"
    tags = {
      env = "prod"
    }
  }
    rg2 = {
      name     = "raj-ki"
      location = "eastus"
      tags = {
        env = "prod"
      }


    }
}
  


vnet = {
  "vnet1" = {
    name                = "raj-vnet"
    location            = "eastus"
    resource_group_name = "raj-ki"
    address_space       = ["10.0.0.0/16"]
    subnet = {
      sub1 = {
        sub_name       = "subnet-1"
        address_prefix = ["10.0.1.0/24"]
      }
      sub2 = {
        sub_name       = "subnet-2"
        address_prefix = ["10.0.2.0/24"]
      }
    }

    tags = {
      environment = "dev"
    }
  }
}
linux_vms = {
  "vm1" = {
    nic_name            = "raj-nic"
    location            = "eastus"
    resource_group_name = "raj-ki"

    sub_name             = "subnet-1"
    virtual_network_name = "raj-vnet"
    vm_name              = "frontend-vm"
    size                 = "Standard_F2"
    admin_username       = "Adminuser@!21"
    admin_password       = "ASSnjsgjdac*&^%"

  }
  "vm2" = {
    nic_name            = "raj-nic"
    location            = "eastus"
    resource_group_name = "raj-ki"

    sub_name             = "subnet-2"
    virtual_network_name = "raj-vnet"
    vm_name              = "backend-vm"
    size                 = "Standard_F2"
    admin_username       = "Adminuser@!21"
    admin_password       = "ASSnjsgjdac*&^%"

  }
}

