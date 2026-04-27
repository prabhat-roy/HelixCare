# e-prescription

Service in the telehealth domain of HelixCare.

Language: Go Â· Port: 50143

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/e-prescription/](../../../helm/charts/e-prescription/) â€” Helm chart
- [manifests/telehealth/e-prescription/](../../../manifests/telehealth/e-prescription/) â€” Raw K8s manifests
