output "region"           { value = "eastus" }
output "aks_name"         { value = azurerm_kubernetes_cluster.this.name }
output "aks_fqdn"         { value = azurerm_kubernetes_cluster.this.fqdn }
output "vnet_id"          { value = azurerm_virtual_network.this.id }
output "postgres_fqdn"    { value = azurerm_postgresql_flexible_server.this.fqdn  sensitive = true }
output "redis_hostname"   { value = azurerm_redis_cache.this.hostname }
output "documents_storage"{ value = azurerm_storage_account.documents.name }
output "dicom_storage"    { value = azurerm_storage_account.dicom.name }
output "key_vault_uri"    { value = azurerm_key_vault.this.vault_uri }
