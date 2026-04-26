resource "random_password" "pg" { length = 32  special = true }

resource "azurerm_postgresql_flexible_server" "this" {
  name                          = "helixcare-${var.environment}-eastus"
  resource_group_name           = azurerm_resource_group.this.name
  location                      = var.location
  version                       = "16"
  administrator_login           = "helixcareadm"
  administrator_password        = random_password.pg.result
  sku_name                      = "GP_Standard_D4s_v3"
  storage_mb                    = 1048576
  backup_retention_days         = 35
  geo_redundant_backup_enabled  = false  # PHI must stay regional
  high_availability { mode = "ZoneRedundant" }
  delegated_subnet_id           = azurerm_subnet.data.id
}

resource "azurerm_redis_cache" "this" {
  name                = "helixcare-${var.environment}-eastus"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  capacity            = 2
  family              = "P"
  sku_name            = "Premium"
  non_ssl_port_enabled = false
  minimum_tls_version  = "1.2"
}

resource "azurerm_eventhub_namespace" "kafka" {
  name                = "helixcare-${var.environment}-eastus"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  sku                 = "Premium"
  capacity            = 4
  zone_redundant      = true
}
