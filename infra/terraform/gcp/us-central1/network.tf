resource "google_compute_network" "vpc" {
  name                    = "helixcare-${var.environment}-us-central1"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "private" {
  name          = "helixcare-private"
  ip_cidr_range = "10.60.0.0/20"
  region        = "us-central1"
  network       = google_compute_network.vpc.id
  private_ip_google_access = true
  secondary_ip_range {
    range_name    = "pods"
    ip_cidr_range = "10.61.0.0/16"
  }
  secondary_ip_range {
    range_name    = "services"
    ip_cidr_range = "10.62.0.0/20"
  }
}

resource "google_compute_router" "router" {
  name    = "helixcare-router"
  region  = "us-central1"
  network = google_compute_network.vpc.id
}

resource "google_compute_router_nat" "nat" {
  name                               = "helixcare-nat"
  router                             = google_compute_router.router.name
  region                             = "us-central1"
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
