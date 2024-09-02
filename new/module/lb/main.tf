resource "azurerm_public_ip" "lb_public_ip" {
  name                = "${var.resource_group_name}-lb-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Basic"
}

resource "azurerm_lb" "lb" {
  name                = "${var.resource_group_name}-lb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Basic"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend" {
  name                = "${var.resource_group_name}-backend-pool"
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.lb.id
}

resource "azurerm_lb_probe" "lb_probe" {
  name                = "${var.resource_group_name}-lb-probe"
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.lb.id
  protocol            = "Tcp"
  port                = 80
  interval_in_seconds = 15
  number_of_probes    = 2
}

resource "azurerm_lb_rule" "lb_rule" {
  name                           = "${var.resource_group_name}-lb-rule"
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.lb.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_id        = azurerm_lb_backend_address_pool.backend.id
  probe_id                       = azurerm_lb_probe.lb_probe.id
}

output "public_ip_id" {
  description = "The ID of the public IP"
  value       = azurerm_public_ip.lb_public_ip.id
}

output "load_balancer_id" {
  description = "The ID of the load balancer"
  value       = azurerm_lb.lb.id
}

output "backend_address_pool_id" {
  description = "The ID of the backend address pool"
  value       = azurerm_lb_backend_address_pool.backend.id
}

output "lb_probe_id" {
  description = "The ID of the load balancer probe"
  value       = azurerm_lb_probe.lb_probe.id
}

output "lb_rule_id" {
  description = "The ID of the load balancer rule"
  value       = azurerm_lb_rule.lb_rule.id
}
