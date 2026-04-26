# infra — HelixCare Infrastructure (Terraform)

Per-cloud, per-region modules. PHI residency is enforced at the data-plane:
- One Terraform stack per (cloud, region). State lives in cloud-native backends.
- Databases (PostgreSQL, MongoDB, Redis, Cassandra, Elasticsearch, TimescaleDB)
  are provisioned per region; replicas never cross region for PHI workloads.
- KMS keys are region-scoped. PHI buckets/discs/streams use per-region CMKs.
- Networking: per-region VPC/VNet, no global PHI routes; cross-region traffic
  for PHI is administratively prohibited and enforced by Cilium policies.

```
infra/terraform/
  aws/{us-east-1,us-west-2,eu-west-1}/
  gcp/{us-central1,us-east1,europe-west1}/
  azure/{eastus,westeurope,centralus}/
  modules/
```
