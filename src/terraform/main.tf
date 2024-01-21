terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
    
  }
  
# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = ["10.0.0.0/16"]  # Customize the address space as needed
}
resource "azurerm_subnet" "subnet" {
  name                 = "my-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = ["10.0.0.0/24"]

  delegation {
    name = "diskspool"

    service_delegation {
      actions = ["Microsoft.Network/virtualNetworks/read"]
      name    = "Microsoft.StoragePool/diskPools"
    }
  }
}

resource "azurerm_disk_pool" "example" {
  name                = "diskpool"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = "Basic_B1"
  subnet_id           = var.subnet_name
  zones               = ["1"]
}
