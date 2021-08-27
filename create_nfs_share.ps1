New-AzRmStorageShare `
    -StorageAccount "sapocnfs" `
    -Name "fspocnfs" `
    -EnabledProtocol "NFS" `
    -RootSquash "RootSquash" `
    -QuotaGiB 100

az storage share-rm create \
    --resource-group RG-POC-NFS \
    --storage-account sapocnfs \
    --name "fspocnfs" \
    --enabled-protocol NFS \
    --root-squash RootSquash \
    --quota 100
