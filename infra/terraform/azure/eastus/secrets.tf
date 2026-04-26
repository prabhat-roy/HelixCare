data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                       = "helixcareprodeastuskv"
  location                   = var.location
  resource_group_name        = azurerm_resource_group.this.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = 90
  purge_protection_enabled   = true
  enable_rbac_authorization  = true
}

resource "azurerm_key_vault_key" "cmk" {
  name         = "helixcare-cmk"
  key_vault_id = azurerm_key_vault.this.id
  key_type     = "RSA-HSM"
  key_size     = 4096
  key_opts     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
  rotation_policy {
    automatic { time_before_expiry = "P30D" }
    expire_after         = "P1Y"
    notify_before_expiry = "P30D"
  }
}

resource "azurerm_key_vault_secret" "pg" {
  name         = "postgres-credentials"
  value        = jsonencode({ user = azurerm_postgresql_flexible_server.this.administrator_login, pass = random_password.pg.result, host = azurerm_postgresql_flexible_server.this.fqdn })
  key_vault_id = azurerm_key_vault.this.id
}
