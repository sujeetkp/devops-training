/*
resource "azurerm_linux_virtual_machine" "vm_linux" {
  depends_on = [ 
    azurerm_network_interface.vm_nic, 
    azurerm_resource_group.vm_rg 
  ]
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.vm_rg.name
  location            = azurerm_resource_group.vm_rg.location
  size                = "Standard_B2s"
  admin_username      = "azureuser"
  admin_password      = "Welcome@123"

  network_interface_ids = [
    azurerm_network_interface.vm_nic.id,
  ]
  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

}

resource "azurerm_resource_group" "vm_rg" {
  name     = "vm-rg"
  location = "Central India"
}

resource "azurerm_public_ip" "vm_publicip" {
  name                = "vm-publicip"
  resource_group_name = azurerm_resource_group.vm_rg.name
  location            = azurerm_resource_group.vm_rg.location
  allocation_method   = "Static"
  sku = "Standard"
}

resource "azurerm_virtual_network" "vm_network" {
  # count = 2
  # name                = "vm-network-${count.index}"
  name                = "vm-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name
}

resource "azurerm_subnet" "vm_subnet" {
  name                 = "vm-subnet"
  resource_group_name  = azurerm_resource_group.vm_rg.name
  virtual_network_name = azurerm_virtual_network.vm_network.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "vm_nic" {
  name                = "vm-nic"
  location            = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_publicip.id 
  }
}
*/