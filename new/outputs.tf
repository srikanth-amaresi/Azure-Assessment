output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  description = "The location of the resource group"
  value       = azurerm_resource_group.rg.location
}

output "virtual_network_name" {
  description = "The name of the virtual network"
  value       = module.vnet.virtual_network_name
}

output "subnet1_id" {
  description = "The ID of subnet 1"
  value       = module.vnet.subnet1_id
}

output "subnet2_id" {
  description = "The ID of subnet 2"
  value       = module.vnet.subnet2_id
}

output "route_table_id" {
  description = "The ID of the route table"
  value       = module.vnet.route_table_id
}

output "nsg1_id" {
  description = "The ID of the first network security group"
  value       = module.nsg.nsg1_id
}

output "nsg2_id" {
  description = "The ID of the second network security group"
  value       = module.nsg.nsg2_id
}

output "subnet1_nsg_association_id" {
  description = "The ID of the association between subnet 1 and NSG 1"
  value       = module.nsg.subnet1_nsg_association_id
}

output "subnet2_nsg_association_id" {
  description = "The ID of the association between subnet 2 and NSG 2"
  value       = module.nsg.subnet2_nsg_association_id
}

output "network_interface_ids" {
  description = "The IDs of the network interfaces"
  value       = module.vms.network_interface_ids
}

output "virtual_machine_ids" {
  description = "The IDs of the virtual machines"
  value       = module.vms.virtual_machine_ids
}

output "virtual_machine_private_ips" {
  description = "The private IPs of the virtual machines"
  value       = module.vms.virtual_machine_private_ips
}

output "public_ip_id" {
  description = "The ID of the lb public IP"
  value       = module.lb.public_ip_id
}

output "load_balancer_id" {
  description = "The ID of the load balancer"
  value       = module.lb.load_balancer_id
}

output "backend_address_pool_id" {
  description = "The ID of the backend address pool"
  value       = module.lb.backend_address_pool_id
}

output "lb_probe_id" {
  description = "The ID of the load balancer probe"
  value       = module.lb.lb_probe_id
}

output "lb_rule_id" {
  description = "The ID of the load balancer rule"
  value       = module.lb.lb_rule_id
}
