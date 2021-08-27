output "UNC" {
  description = "UNC"
  value       = azurerm_storage_account.sa_poc_nfs.primary_file_host
}


output "account_id" {
  value = azurerm_storage_account.sa_poc_nfs.id
}

output "account_name" {
  value = azurerm_storage_account.sa_poc_nfs.name
}

# outputs
output "private_ip" {
  value = azurerm_private_endpoint.this.private_service_connection[0].private_ip_address
}


# cmdkey /generic:"20.44.102.56" /user:"localadmin" /pass:"Pa55w0.rd1234"




