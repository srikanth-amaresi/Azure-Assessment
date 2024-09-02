variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location of the resources"
  type        = string
}

variable "vnet_id" {
  description = "The ID of the virtual network"
  type        = string
}

variable "subnet1_id" {
  description = "The ID of subnet 1"
  type        = string
}
