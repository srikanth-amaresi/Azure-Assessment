variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "resource-group"
}

variable "location" {
  description = "Location of the resources"
  type        = string
  default     = "CentralIndia"
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "vnet"
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet1_name" {
  description = "Name of subnet 1"
  type        = string
  default     = "subnet1"
}

variable "subnet1_prefix" {
  description = "Address prefix for subnet 1"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "subnet2_name" {
  description = "Name of subnet 2"
  type        = string
  default     = "subnet2"
}

variable "subnet2_prefix" {
  description = "Address prefix for subnet 2"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "route_table_name" {
  description = "Name of the route table"
  type        = string
  default     = "route-table-1"
}

variable "number_of_machines" {
  type = number
  description = "This defines the number of virtual machines in the virtual network"
  default = 2
}
