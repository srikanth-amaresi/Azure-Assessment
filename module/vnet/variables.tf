variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location of the resources"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "subnet1_name" {
  description = "Name of subnet 1"
  type        = string
}

variable "subnet1_prefix" {
  description = "Address prefix for subnet 1"
  type        = list(string)
}

variable "subnet2_name" {
  description = "Name of subnet 2"
  type        = string
}

variable "subnet2_prefix" {
  description = "Address prefix for subnet 2"
  type        = list(string)
}

variable "route_table_name" {
  description = "Name of the route table"
  type        = string
}
