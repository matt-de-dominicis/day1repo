provider "azurerm" {
  features {
      resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

resource "azurerm_resource_group" "day2_rg" {
  name     = "day2_rg"
  location = "West Europe"
  tags = { environment = "test" }
}