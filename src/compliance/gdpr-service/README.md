# gdpr-service

Service in the compliance domain of HelixCare.

Language: Go Â· Port: 50323

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/gdpr-service/](../../../helm/charts/gdpr-service/) â€” Helm chart
- [manifests/compliance/gdpr-service/](../../../manifests/compliance/gdpr-service/) â€” Raw K8s manifests
