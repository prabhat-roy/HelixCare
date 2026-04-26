terraform {
  required_version = ">= 1.9.0"
  required_providers {
    azurerm    = { source = "hashicorp/azurerm",    version = "~> 4.5" }
    azuread    = { source = "hashicorp/azuread",    version = "~> 3.0" }
    kubernetes = { source = "hashicorp/kubernetes", version = "~> 2.32" }
    helm       = { source = "hashicorp/helm",       version = "~> 2.15" }
    random     = { source = "hashicorp/random",     version = "~> 3.6" }
  }
  backend "azurerm" {
    resource_group_name  = "helixcare-tfstate"
    storage_account_name = "helixcaretfstateeastus"
    container_name       = "tfstate"
    key                  = "helixcare/azure/eastus/terraform.tfstate"
  }
}

provider "azurerm" { features {} }
