# Shared Terraform modules

Reusable, region-parameterised modules:
- eks/, gke/, aks/                — Kubernetes cluster wrappers
- postgres/, mongo/, redis/       — managed database wrappers (region-pinned)
- kafka/, nats/                   — streaming
- kms/                            — region CMK + alias
- vault/                          — Vault Helm release wrapper

All modules accept `region` as required input and expose only region-bound outputs.
