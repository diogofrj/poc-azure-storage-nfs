resource "azurerm_virtual_network" "poc_nfs_network" {
  name                = "VNET-${var.prefix_project}"
  location            = var.region
  resource_group_name = azurerm_resource_group.rg_storage_nfs.name
  address_space       = ["10.100.0.0/16"]
//  dns_servers         = ["10.100.1.4", "10.100.1.5"] // TODO: Mudar para variaveis
}

resource "azurerm_subnet" "sn_poc_subnet" {
  name                 = "SN-POC-SUBNET"
  resource_group_name  = azurerm_virtual_network.poc_nfs_network.resource_group_name
  virtual_network_name = azurerm_virtual_network.poc_nfs_network.name
  address_prefixes     = ["10.100.1.0/24"]

  enforce_private_link_service_network_policies  = true
  enforce_private_link_endpoint_network_policies = true

  service_endpoints = ["Microsoft.Storage"]

}