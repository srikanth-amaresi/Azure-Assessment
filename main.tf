terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.10.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "5d07f29b-05f5-----24fac93815c1"
  tenant_id       = "a4e35b9c-b7c3------------a2f5-0b3ad383e5f7"
  client_id       = "d7f42c75--------8dee-42d1028d7971"
  client_secret   = "16U8Q-----------2UZcES"
  features        {}
}

module "vnet" {
  source              = "/module/vnet"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  subnet1_name        = var.subnet1_name
  subnet1_prefix      = var.subnet1_prefix
  subnet2_name        = var.subnet2_name
  subnet2_prefix      = var.subnet2_prefix
  route_table_name    = var.route_table_name
}

module "nsg" {
  source              = "/modules/nsg"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet1_id          = module.vnet.subnet1_id
  subnet2_id          = module.vnet.subnet2_id
}

module "lb" {
  source              = "/module/lb"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_id             = module.vnet.vnet_id
  subnet1_id          = module.vnet.subnet1_id
}

module "vms" {
  source              = "/module/vms"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet1_id          = module.vnet.subnet1_id
  number_of_machines  = var.number_of_machines
  lb_backend_pool_id  = module.lb.backend_address_pool_id
}
