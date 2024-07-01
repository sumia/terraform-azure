terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.110.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

# create resource group
resource "azurerm_resource_group" "main" {
  name     = "learn-tf-rg-uksouth"
  location = "uksouth"
}

# create virtual network
resource "azurerm_virtual_network" "main" {
  name                = "learn-tf-vnet-uksouth"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/16"]
}

# create subnet
resource "azurerm_subnet" "main" {
  name                 = "learn-tf-submet-uksouth"
  virtual_network_name = azurerm_virtual_network.main.name
  resource_group_name  = azurerm_resource_group.main.name
  address_prefixes     = ["10.0.0.0/24"]
}

# create network interface card
resource "azurerm_network_interface" "internal" {
  name                = "learn-tf-nic-int-uksouth"
  location            = azurerm_virtual_network.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
  }
}

# create virtual machine
resource "azurerm_windows_virtual_machine" "main" {
  name                = "learn-tf-vm-uks"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = "Standard_B1s"
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  network_interface_ids = [
    azurerm_network_interface.internal.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-DataCenter"
    version   = "latest"
  }
}
