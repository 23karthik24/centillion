resource "azurerm_data_factory" "terra-karthik" {
  name                = "terra-karthik"
  location            = azurerm_resource_group.terra-karthik.location
  resource_group_name = azurerm_resource_group.terra-karthik.name
}

resource "azurerm_data_factory_pipeline" "terra-karthik" {
  name            = "terra-karthik"
  data_factory_id = azurerm_data_factory.terra-karthik.id
}