terraform {
}

resource "azurerm_network_security_group" "terra-karthik" {
  name                = "terra-vr-secu"
  resource_group_name  = azurerm_resource_group.terra-karthik.name
  location            = azurerm_resource_group.terra-karthik.location

  security_rule {
    name                       = "Allow_HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    "environment" = "Production"
    "terraform"   = "terraform"
  }
}