resource "azurerm_resource_group" "day2_rg" {
  name     = "Day 2 Azure Resource Group"
  location = "West Europe"
  tags = "Test"
}