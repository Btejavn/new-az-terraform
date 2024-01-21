variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "my-rg123"
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "my-vnet123"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "my-subnet123"
}