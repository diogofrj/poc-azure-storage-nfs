#*********************************************************************************************
#         ,d8    88b           d88   ad88888ba  888888888888                     88          *
#       ,d888    888b         d888  d8"     "8b      88                          88          *
#     ,d8" 88    88`8b       d8'88  Y8,              88                          88          *
#   ,d8"   88    88 `8b     d8' 88  `Y8aaaaa,        88   ,adPPYba,   ,adPPYba,  88,dPPYba,  *
# ,d8"     88    88  `8b   d8'  88    `"""""8b,      88  a8P_____88  a8"     ""  88P'    "8a * 
# 8888888888888  88   `8b d8'   88          `8b      88  8PP"""""""  8b          88       88 * 
#          88    88    `888'    88  Y8a     a8P      88  "8b,   ,aa  "8a,   ,aa  88       88 *
#          88    88     `8'     88   "Y88888P"       88   `"Ybbd8"'   `"Ybbd8"'  88       88 *
#*********************************************************************************************

#   ____   ____     
#  |  _ \ / ___|___ 
#  | |_) | |  _/ __|
#  |  _ <| |_| \__ \
#  |_| \_\\____|___/
#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group


resource "azurerm_storage_account" "sa_poc_nfs" {
  name                      = "sapocnfs"
  resource_group_name       = azurerm_resource_group.rg_storage_nfs.name
  location                  = var.region
  account_tier              = "Premium"
  account_replication_type  = "LRS"
  large_file_share_enabled  = true
  enable_https_traffic_only = false
  account_kind              = "FileStorage"
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false
  
  
  
  tags = var.tags
}

resource "azurerm_storage_account_network_rules" "permit_subnet" {
  resource_group_name  = azurerm_resource_group.rg_storage_nfs.name
  storage_account_name = azurerm_storage_account.sa_poc_nfs.name

  default_action             = "Deny"
  ip_rules                   = ["187.67.86.15"]
  virtual_network_subnet_ids = [azurerm_subnet.sn_poc_subnet.id]
  bypass                     = ["AzureServices","Metrics"]
  private_link_access {
    endpoint_resource_id = azurerm_private_endpoint.this.subnet_id
  }

}



resource "azurerm_private_endpoint" "this" {
  name                = "${var.prefix_project}-pe"
  location            = azurerm_resource_group.rg_storage_nfs.location
  resource_group_name = azurerm_resource_group.rg_storage_nfs.name
  subnet_id           = azurerm_subnet.sn_poc_subnet.id

  private_service_connection {
    name                           = "${var.prefix_project}-psc"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_storage_account.sa_poc_nfs.id
    subresource_names              = ["file"]
  }

}