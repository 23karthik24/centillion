resource "azurerm_network_interface" "terra-karthik" {
  name                = "terra-karthik-nic"
  location            = azurerm_resource_group.terra-karthik.location
  resource_group_name = azurerm_resource_group.terra-karthik.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.terra-karthik.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.terra-karthik.id
  }
}

resource "azurerm_linux_virtual_machine" "terra-karthik" {
  name                = "terra-karthik-machine01"
  resource_group_name = azurerm_resource_group.terra-karthik.name
  location            = azurerm_resource_group.terra-karthik.location
  size                = "Standard_D2_v2"
  admin_username      = "karthik"
  network_interface_ids = [
    azurerm_network_interface.terra-karthik.id,
  ]

  admin_ssh_key {
    username   = "karthik"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}