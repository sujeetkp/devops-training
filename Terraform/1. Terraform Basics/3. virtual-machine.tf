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

resource "azurerm_subnet_network_security_group_association" "vm_subnet_nsg_associate" {
  depends_on = [ azurerm_network_security_rule.vm_nsg_rule_inbound]    
  subnet_id                 = azurerm_subnet.vm_subnet.id
  network_security_group_id = azurerm_network_security_group.vm_subnet_nsg.id
}

# Resource-4: Create NSG Rules
## Locals Block for Security Rules
locals {
  vm_inbound_ports_map = {
    "100" : "22", # If the key starts with a number, you must use the colon syntax ":" instead of "="
    "110" : "3389"
  } 
}
## NSG Inbound Rule for Bastion / Management Subnets
resource "azurerm_network_security_rule" "vm_nsg_rule_inbound" {
  for_each = local.vm_inbound_ports_map
  name                        = "Rule-Port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value 
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.vm_rg.name
  network_security_group_name = azurerm_network_security_group.vm_subnet_nsg.name
}

output "vm_private_ip" {
  value = azurerm_linux_virtual_machine.vm_linux.private_ip_address
}

output "vm_public_ip" {
  value = azurerm_linux_virtual_machine.vm_linux.public_ip_address
}
*/