provider "azurerm" {
  features {
      resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

resource "azurerm_resource_group" "day3_rg" {
  name     = "example"
  location = "East US"
}

resource "azurerm_storage_account" "day3-storage-acct-1" {
  name                     = "day3exercisestorageacct1"
  resource_group_name      = azurerm_resource_group.day3_rg.name
  location                 = azurerm_resource_group.day3_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    storage = "first-sa"
  }
}

resource "azurerm_storage_account" "day3-storage-acct-2" {
  name                     = "day3exercisestorageacct2"
  resource_group_name      = azurerm_resource_group.day3_rg.name
  location                 = azurerm_resource_group.day3_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on = [azurerm_storage_account.day3-storage-acct-1]

  tags = {
    storage = "second-sa"
  }
}
