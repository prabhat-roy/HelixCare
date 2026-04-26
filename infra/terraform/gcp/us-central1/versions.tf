terraform {
  required_version = ">= 1.9.0"
  required_providers {
    google     = { source = "hashicorp/google",     version = "~> 6.5" }
    kubernetes = { source = "hashicorp/kubernetes", version = "~> 2.32" }
    helm       = { source = "hashicorp/helm",       version = "~> 2.15" }
  }
  backend "gcs" {
    bucket = "helixcare-tfstate-gcp-us-central1"
    prefix = "helixcare/gcp/us-central1"
  }
}

provider "google" {
  project = var.project
  region  = "us-central1"
}
