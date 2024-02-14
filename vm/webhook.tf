resource "azurerm_container_registry" "acr" {
  name                = "karhikregistry"
  resource_group_name = azurerm_resource_group.terra-karthik.name
  location            = azurerm_resource_group.terra-karthik.location
  sku                 = "Standard"
  admin_enabled       = false
}

resource "azurerm_container_registry_webhook" "webhook" {
  name                = "karthikwebhook"
  resource_group_name = azurerm_resource_group.terra-karthik.name
  registry_name       = azurerm_container_registry.acr.name
  location            = azurerm_resource_group.terra-karthik.location

  service_uri = "https://karthikwebhook.terra-demo/mytag"
  status      = "enabled"
  scope       = "mytag:*"
  actions     = ["push"]
  custom_headers = {
    "Content-Type" = "application/json"
  }
}