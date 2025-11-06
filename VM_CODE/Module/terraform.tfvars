rg = {
  rg1 = {
    name     = "raj"
    location = "eastus"
    tags = {
      env   = "dev"
      owner = "raj"
    }
  }
}

network = {
  net1 = {
    name                = "rajvnet"
    location            = "eastus"
    resource_group_name = "raj"
    address_space       = ["10.0.0.0/16"]
    subnet = {
      sub1 = {
        sub_name       = "subnet1"
        address_prefix = ["10.0.1.0/24"]
      }
      sub2 = {
        sub_name       = "subnet2"
        address_prefix = ["10.0.2.0/24"]
      }
    }
    tags = {
      env   = "dev"
      owner = "raj"
    }
  }
}

linux_vm = {
  "vm1" = {
    nic_name             = "raj_nic"
    location             = "eastus"
    resource_group_name  = "raj"
    subnet_name          = "subnet-1"
    virtual_network_name = "rajvnet"
    vm                   = "rajvm"
    size                 = "Standard_F2"
    admin_username       = "admin#23fsf"
    admin_password       = "akAksbkdb@171771"
    os_disk = {
      os1= {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
      }
    }
    source_image_reference = {
      s1={
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
      }
    }


  }
}
