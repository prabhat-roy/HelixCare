resource "google_container_cluster" "this" {
  name                     = "helixcare-${var.environment}-us-central1"
  location                 = "us-central1"
  network                  = google_compute_network.vpc.id
  subnetwork               = google_compute_subnetwork.private.id
  remove_default_node_pool = true
  initial_node_count       = 1
  min_master_version       = var.gke_version

  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }

  workload_identity_config { workload_pool = "${var.project}.svc.id.goog" }

  database_encryption {
    state    = "ENCRYPTED"
    key_name = google_kms_crypto_key.helixcare.id
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }
}

resource "google_container_node_pool" "general" {
  name       = "general"
  cluster    = google_container_cluster.this.name
  location   = "us-central1"
  node_count = var.node_min
  autoscaling { min_node_count = var.node_min  max_node_count = var.node_max }
  node_config {
    machine_type    = var.machine_type
    service_account = google_service_account.gke.email
    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
    labels          = { "helixcare.io/node-class" = "general", "topology.kubernetes.io/region" = "us-central1" }
    workload_metadata_config { mode = "GKE_METADATA" }
  }
}

resource "google_container_node_pool" "ml" {
  name       = "ml"
  cluster    = google_container_cluster.this.name
  location   = "us-central1"
  node_count = 2
  autoscaling { min_node_count = 2  max_node_count = 10 }
  node_config {
    machine_type    = "n1-standard-8"
    guest_accelerator { type = "nvidia-tesla-t4"  count = 1 }
    service_account = google_service_account.gke.email
    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
    labels          = { "helixcare.io/node-class" = "ml" }
    taint           = [{ key = "ml-only", value = "true", effect = "NO_SCHEDULE" }]
  }
}

resource "google_service_account" "gke" {
  account_id   = "helixcare-gke-us-central1"
  display_name = "HelixCare GKE us-central1"
}
