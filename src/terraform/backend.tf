terraform {
  backend "azurerm" {
    resource_group_name   = "rg1"
    storage_account_name   = "storagetrg1"
    container_name         = "tfstate"
    key                    = "terraform.tfstate"
  }
}