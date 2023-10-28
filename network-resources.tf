resource "azurerm_virtual_network" "kubvn" {
  name = var.vnet_name
  location = azurerm_resource_group.kub-rg.location
  resource_group_name = azurerm_resource_group.kub-rg.name
  address_space = [ "10.1.0.0/16" ]
}

resource "azurerm_subnet" "kubinternal" {
  name = var.subnet_name
  virtual_network_name = azurerm_virtual_network.kubvn.name
  resource_group_name = azurerm_resource_group.kub-rg.name
  address_prefixes = [ "10.1.0.0/22" ]
}