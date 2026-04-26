# Vault policy: helixcare app services
path "secret/data/helixcare/{{identity.entity.aliases.auth_kubernetes_*.metadata.service_account_name}}/*" {
  capabilities = ["read"]
}
path "transit/encrypt/helixcare-phi" { capabilities = ["update"] }
path "transit/decrypt/helixcare-phi" { capabilities = ["update"] }
path "database/creds/helixcare-postgres" { capabilities = ["read"] }
path "pki/issue/helixcare-mtls" { capabilities = ["update"] }
