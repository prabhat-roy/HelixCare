# helm/charts — HelixCare service charts

One Helm chart per microservice, cloud-agnostic by default with overlays for AWS/GCP/Azure.
PHI services pin region affinity through `nodeSelector` and per-region `values-{cloud}.yaml`
to satisfy HIPAA data-residency.

Each chart ships:
- Chart.yaml, values.yaml, values-aws.yaml, values-gcp.yaml, values-azure.yaml
- templates/_helpers.tpl, templates/deployment.yaml, templates/service.yaml, templates/serviceaccount.yaml
