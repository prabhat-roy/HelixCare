# consent-service

Service in the compliance domain of HelixCare.

Language: Go Â· Port: 50320

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/consent-service/](../../../helm/charts/consent-service/) â€” Helm chart
- [manifests/compliance/consent-service/](../../../manifests/compliance/consent-service/) â€” Raw K8s manifests
