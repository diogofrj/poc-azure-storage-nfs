
## <https://www.terraform.io/docs/providers/azurerm/r/network_interface.html>
resource "azurerm_network_interface" "nic_nfs" {
  name                = "nic-vmwindows"
  location            = azurerm_resource_group.rg_storage_nfs.location
  resource_group_name = azurerm_resource_group.rg_storage_nfs.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.sn_poc_subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.100.1.10"
    primary                       = true
    private_ip_address_version    = "IPv4"
    public_ip_address_id          = azurerm_public_ip.pip_nfs.id
  }

}

resource "azurerm_public_ip" "pip_nfs" {
  name                = "PIP-VM-WIN-POC"
  resource_group_name = azurerm_resource_group.rg_storage_nfs.name
  location            = azurerm_resource_group.rg_storage_nfs.location
  allocation_method   = "Dynamic"

}

## <https://www.terraform.io/docs/providers/azurerm/r/windows_virtual_machine.html>
resource "azurerm_windows_virtual_machine" "vm_nfs" {
  name                = "VM-WIN-POC-NFS"
  resource_group_name = azurerm_resource_group.rg_storage_nfs.name
  location            = azurerm_resource_group.rg_storage_nfs.location
  size                = "Standard_B4ms"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.nic_nfs.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "VM-WIN-POC-OSDDISK"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter-smalldisk"
    version   = "latest"
  }
  license_type = "Windows_Server"

}



# outputs
output "CMDKEY" {
  value = "cmdkey /generic:${azurerm_public_ip.pip_nfs.ip_address} /user:${azurerm_windows_virtual_machine.vm_nfs.admin_username} /pass:${nonsensitive(azurerm_windows_virtual_machine.vm_nfs.admin_password)}"
}
output "VM-NFS-WIN" {
  value = "mstsc /v:${azurerm_public_ip.pip_nfs.ip_address}"
}