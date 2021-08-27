# PoC Azure Storage Blob NFS
PoC NFS utilizando Azure Storage Blob


# Deploy

https://docs.microsoft.com/en-us/azure/storage/files/storage-files-how-to-create-nfs-shares?tabs=azure-powershell

- Registre o Provider para habilitar o NFS na assinatura
- Crie um storage Premium do tipo FileShare (o Registro do Provider tem que ser feito antes)
- ‎"Secure transfer required" é uma configuração habilitada para esta conta de armazenamento. O protocolo NFS não suporta criptografia e depende da segurança em nível de rede. Esta configuração deve ser desativada para que o NFS funcione.‎

- 


- OBS: Criação dos recursos via Terraform:
    - Não existe recurso disponivel para criar um fileshare do tipo NFS, portanto, deverá ser criado via PowerShell ou Azure CLI
