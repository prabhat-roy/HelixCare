# terraform â€” Per-cloud, per-region

```
infra/terraform/
  aws/{us-east-1,us-west-2,eu-west-1}/...
  gcp/{us-central1,us-east1,europe-west1}/...
  azure/{eastus,westeurope,centralus}/...
  modules/  shared modules (eks/gke/aks, postgres, kafka, kms)
```

Each region directory contains: versions.tf, variables.tf, network.tf,
kubernetes.tf, databases.tf, storage.tf, secrets.tf, outputs.tf, prod.tfvars.

HIPAA residency contract: backends and providers are pinned to the directory's
region. No `provider` blocks span regions for PHI buckets, discs, or queues.
