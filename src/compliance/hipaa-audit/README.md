# hipaa-audit

Service in the compliance domain of HelixCare.

Language: Go Â· Port: 50322

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/hipaa-audit/](../../../helm/charts/hipaa-audit/) â€” Helm chart
- [manifests/compliance/hipaa-audit/](../../../manifests/compliance/hipaa-audit/) â€” Raw K8s manifests
