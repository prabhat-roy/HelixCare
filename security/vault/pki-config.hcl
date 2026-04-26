# Vault PKI for service mesh mTLS (SPIFFE IDs)
path "pki/root/generate/internal" {
  common_name = "helixcare-root-ca"
  ttl         = "87600h"
}

path "pki/roles/helixcare-mtls" {
  allowed_domains    = ["helixcare.internal","helixcare.svc.cluster.local"]
  allow_subdomains   = true
  enforce_hostnames  = true
  max_ttl            = "72h"
  ttl                = "24h"
  key_type           = "ec"
  key_bits           = 384
}
