terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "6f4edd7c-127b-448f-a9a9-a3644530720a"
  features {}
}

resource "azurerm_resource_group" "terra-karthik" {
  name     = "terra-karthik-rg"
  location = "east us"
}