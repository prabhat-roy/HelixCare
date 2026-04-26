resource "azurerm_kubernetes_cluster" "this" {
  name                = "helixcare-${var.environment}-eastus"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  dns_prefix          = "helixcare-${var.environment}-eastus"
  kubernetes_version  = var.aks_version

  default_node_pool {
    name                = "general"
    vm_size             = var.vm_size
    vnet_subnet_id      = azurerm_subnet.aks.id
    auto_scaling_enabled = true
    min_count           = var.node_min
    max_count           = var.node_max
    node_labels         = { "helixcare.io/node-class" = "general", "topology.kubernetes.io/region" = "eastus" }
  }

  identity { type = "SystemAssigned" }
  workload_identity_enabled = true
  oidc_issuer_enabled       = true

  network_profile {
    network_plugin = "azure"
    network_policy = "cilium"
  }

  azure_active_directory_role_based_access_control {
    azure_rbac_enabled = true
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "ml" {
  name                  = "ml"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.this.id
  vm_size               = "Standard_NC6s_v3"
  auto_scaling_enabled  = true
  min_count             = 2
  max_count             = 10
  node_taints           = ["ml-only=true:NoSchedule"]
  node_labels           = { "helixcare.io/node-class" = "ml" }
}
