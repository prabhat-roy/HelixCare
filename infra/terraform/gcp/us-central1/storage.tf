resource "google_storage_bucket" "documents" {
  name                        = "helixcare-${var.environment}-us-central1-documents"
  location                    = "US-CENTRAL1"
  force_destroy               = false
  uniform_bucket_level_access = true
  versioning { enabled = true }
  encryption { default_kms_key_name = google_kms_crypto_key.helixcare.id }
  lifecycle_rule {
    condition { age = 2557 }
    action    { type = "Delete" }
  }
}

resource "google_storage_bucket" "dicom" {
  name                        = "helixcare-${var.environment}-us-central1-dicom"
  location                    = "US-CENTRAL1"
  uniform_bucket_level_access = true
  encryption { default_kms_key_name = google_kms_crypto_key.helixcare.id }
}
