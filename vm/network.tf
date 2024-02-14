resource "azurerm_virtual_network" "terra-karthik" {
  name                = "terra-karthik-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.terra-karthik.location
  resource_group_name = azurerm_resource_group.terra-karthik.name
}

resource "azurerm_subnet" "terra-karthik" {
  name                 = "SubnetA"
  resource_group_name  = azurerm_resource_group.terra-karthik.name
  virtual_network_name = azurerm_virtual_network.terra-karthik.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_public_ip" "terra-karthik" {
  name                = "terra-karthik-machine01-pip"
  location            = azurerm_resource_group.terra-karthik.location
  resource_group_name = azurerm_resource_group.terra-karthik.name
  allocation_method   = "Static"
}