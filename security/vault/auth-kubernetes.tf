resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
  path = "kubernetes/helixcare"
}

resource "vault_kubernetes_auth_backend_config" "helixcare" {
  backend            = vault_auth_backend.kubernetes.path
  kubernetes_host    = var.kubernetes_host
  kubernetes_ca_cert = var.kubernetes_ca_cert
  token_reviewer_jwt = var.token_reviewer_jwt
}

resource "vault_kubernetes_auth_backend_role" "helixcare-apps" {
  backend                          = vault_auth_backend.kubernetes.path
  role_name                        = "helixcare-apps"
  bound_service_account_names      = ["*"]
  bound_service_account_namespaces = ["helixcare-platform","helixcare-clinical","helixcare-ehr","helixcare-pharmacy","helixcare-telehealth","helixcare-compliance"]
  token_ttl                        = 3600
  token_policies                   = ["helixcare-app"]
}
