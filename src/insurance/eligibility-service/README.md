# eligibility-service

Service in the insurance domain of HelixCare.

Language: Go Â· Port: 50180

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/eligibility-service/](../../../helm/charts/eligibility-service/) â€” Helm chart
- [manifests/insurance/eligibility-service/](../../../manifests/insurance/eligibility-service/) â€” Raw K8s manifests
