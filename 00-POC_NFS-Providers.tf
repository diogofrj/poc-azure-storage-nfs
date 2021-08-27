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
# Responsável: Diogo Fernandes
#*********************************************************************************************
#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}
provider "random" {}

provider "azurerm" {
  features {}
  subscription_id = "d2f93f5a-ec21-4898-b14e-db4995d3b147"
  tenant_id       = "5111b6c6-d49c-4f30-ae94-f32f6a0e053c"
}

