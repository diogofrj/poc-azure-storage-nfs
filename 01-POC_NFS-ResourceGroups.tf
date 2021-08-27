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
resource "azurerm_resource_group" "rg_storage_nfs" {
  name     = "RG-${var.prefix_project}"
  location = var.region
  tags     = var.tags
}


