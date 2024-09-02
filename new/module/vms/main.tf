resource "azurerm_network_interface" "nic" {
  count               = var.number_of_machines
  name                = "${var.resource_group_name}-nic${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet1_id
    private_ip_address_allocation = "Dynamic"
    load_balancer_backend_address_pools_ids = [var.lb_backend_pool_id]
  }
}

resource "azurerm_virtual_machine" "vm" {
  count               = var.number_of_machines
  name                = "${var.resource_group_name}-vm${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.nic[count.index].id]
  vm_size             = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdisk${count.index + 1}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "hostname${count.index + 1}"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "Terraform"
  }
}

output "vm_ids" {
  description = "The IDs of the virtual machines"
  value       = azurerm_virtual_machine.vm[*].id
}

output "nic_ids" {
  description = "The IDs of the network interfaces"
  value       = azurerm_network_interface.nic[*].id
}
