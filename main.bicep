resource stg 'Microsoft.Storage/storageAccounts@2021-02-01' = {
    name: uniqueString(resourceGroup().id)
    location: 'japaneast'
    kind: 'Storage'
    sku: {
        name: 'Standard_LRS'
    }
}
