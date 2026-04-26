resource "google_sql_database_instance" "postgres" {
  name             = "helixcare-${var.environment}-us-central1"
  database_version = "POSTGRES_16"
  region           = "us-central1"
  settings {
    tier              = "db-custom-4-16384"
    availability_type = "REGIONAL"
    disk_encryption_configuration { kms_key_name = google_kms_crypto_key.helixcare.id }
    backup_configuration {
      enabled                        = true
      point_in_time_recovery_enabled = true
      backup_retention_settings { retained_backups = 35 }
    }
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.vpc.id
    }
  }
  deletion_protection = true
}

resource "google_redis_instance" "this" {
  name           = "helixcare-${var.environment}-us-central1"
  tier           = "STANDARD_HA"
  memory_size_gb = 8
  region         = "us-central1"
  authorized_network          = google_compute_network.vpc.id
  transit_encryption_mode     = "SERVER_AUTHENTICATION"
  customer_managed_key        = google_kms_crypto_key.helixcare.id
}

# Pub/Sub used for non-PHI events; Confluent Cloud (Kafka) deployed in same region for PHI streams.
