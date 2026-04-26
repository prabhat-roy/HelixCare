resource "google_kms_key_ring" "helixcare" {
  name     = "helixcare-${var.environment}-us-central1"
  location = "us-central1"
}

resource "google_kms_crypto_key" "helixcare" {
  name            = "helixcare-cmk"
  key_ring        = google_kms_key_ring.helixcare.id
  rotation_period = "7776000s"  # 90 days
}

resource "google_secret_manager_secret" "pg" {
  secret_id = "helixcare-${var.environment}-us-central1-postgres"
  replication {
    user_managed {
      replicas { location = "us-central1"  customer_managed_encryption { kms_key_name = google_kms_crypto_key.helixcare.id } }
    }
  }
}
