resource "azurerm_network_security_group" "nsg1" {
  name                = "${var.resource_group_name}-nsg1"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_security_group" "nsg2" {
  name                = "${var.resource_group_name}-nsg2"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowHTTP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "subnet1" {
  subnet_id                 = var.subnet1_id
  network_security_group_id = azurerm_network_security_group.nsg1.id
}

resource "azurerm_subnet_network_security_group_association" "subnet2" {
  subnet_id                 = var.subnet2_id
  network_security_group_id = azurerm_network_security_group.nsg2.id
}

output "nsg1_id" {
  description = "The ID of the first network security group"
  value       = azurerm_network_security_group.nsg1.id
}

output "nsg2_id" {
  description = "The ID of the second network security group"
  value       = azurerm_network_security_group.nsg2.id
}

output "subnet1_nsg_association_id" {
  description = "The ID of the association between subnet 1 and NSG 1"
  value       = azurerm_subnet_network_security_group_association.subnet1.id
}

output "subnet2_nsg_association_id" {
  description = "The ID of the association between subnet 2 and NSG 2"
  value       = azurerm_subnet_network_security_group_association.subnet2.id
}
