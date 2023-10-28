resource "azurerm_resource_group" "kub-rg" {
  name = var.rgname
  location = var.rglocation
}