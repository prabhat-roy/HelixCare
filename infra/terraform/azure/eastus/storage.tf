resource "azurerm_storage_account" "documents" {
  name                            = "helixcareprodeastusdocs"
  resource_group_name             = azurerm_resource_group.this.name
  location                        = var.location
  account_tier                    = "Standard"
  account_replication_type        = "ZRS"  # zone-redundant, region-bound
  min_tls_version                 = "TLS1_2"
  https_traffic_only_enabled      = true
  allow_nested_items_to_be_public = false
  infrastructure_encryption_enabled = true
}

resource "azurerm_storage_account" "dicom" {
  name                            = "helixcareprodeastusdicom"
  resource_group_name             = azurerm_resource_group.this.name
  location                        = var.location
  account_tier                    = "Premium"
  account_replication_type        = "ZRS"
  min_tls_version                 = "TLS1_2"
  https_traffic_only_enabled      = true
  allow_nested_items_to_be_public = false
}
