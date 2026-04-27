# audit-trail-service

Service in the ehr domain of HelixCare.

Language: Go Â· Port: 50202

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/audit-trail-service/](../../../helm/charts/audit-trail-service/) â€” Helm chart
- [manifests/ehr/audit-trail-service/](../../../manifests/ehr/audit-trail-service/) â€” Raw K8s manifests
