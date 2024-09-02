variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location of the resources"
  type        = string
}

variable "subnet1_id" {
  description = "The ID of subnet 1"
  type        = string
}

variable "lb_backend_pool_id" {
  description = "The ID of the load balancer backend pool"
  type        = string
}

variable "number_of_machines" {
  description = "Number of virtual machines"
  type        = number
  default     = 2
}

variable "admin_username" {
  description = "The admin username for the virtual machines"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the virtual machines"
  type        = string
}
