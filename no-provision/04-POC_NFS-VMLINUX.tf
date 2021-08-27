
## <https://www.terraform.io/docs/providers/azurerm/r/network_interface.html>
resource "azurerm_network_interface" "nic_nfs_lnx" {
  name                = "nic-vmlinux"
  location            = azurerm_resource_group.rg_storage_nfs.location
  resource_group_name = azurerm_resource_group.rg_storage_nfs.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.sn_poc_subnet.id
    primary                       = true
    private_ip_address_allocation = "Static"
    private_ip_address_version    = "IPv4"
    private_ip_address            = "10.100.1.11"
    public_ip_address_id          = azurerm_public_ip.pip_nfs_lnx.id
  }
}

resource "azurerm_public_ip" "pip_nfs_lnx" {
  name                = "PIP-VM-LNX-POC"
  resource_group_name = azurerm_resource_group.rg_storage_nfs.name
  location            = azurerm_resource_group.rg_storage_nfs.location
  allocation_method   = "Dynamic"
}

## <https://www.terraform.io/docs/providers/azurerm/r/windows_virtual_machine.html>
resource "azurerm_linux_virtual_machine" "vm_nfs_lnx" {
  name                = "VM-NFS-LNX"
  resource_group_name = azurerm_resource_group.rg_storage_nfs.name
  location            = azurerm_resource_group.rg_storage_nfs.location
  size                = "Standard_B2ms"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nic_nfs_lnx.id
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}



# outputs

output "VM-NFS-LNX" {
  value = "ssh -i ~/.ssh/id_rsa.pub adminuser@${azurerm_public_ip.pip_nfs_lnx.ip_address}"
}