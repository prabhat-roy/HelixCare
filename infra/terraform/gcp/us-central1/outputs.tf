output "region"           { value = "us-central1" }
output "gke_cluster"      { value = google_container_cluster.this.name }
output "gke_endpoint"     { value = google_container_cluster.this.endpoint  sensitive = true }
output "vpc_id"           { value = google_compute_network.vpc.id }
output "postgres_name"    { value = google_sql_database_instance.postgres.name }
output "redis_host"       { value = google_redis_instance.this.host }
output "documents_bucket" { value = google_storage_bucket.documents.name }
output "dicom_bucket"     { value = google_storage_bucket.dicom.name }
output "kms_key_id"       { value = google_kms_crypto_key.helixcare.id }
