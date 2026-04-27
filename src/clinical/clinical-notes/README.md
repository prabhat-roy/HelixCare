# clinical-notes

Service in the clinical domain of HelixCare.

Language: Go Â· Port: 50081

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/clinical-notes/](../../../helm/charts/clinical-notes/) â€” Helm chart
- [manifests/clinical/clinical-notes/](../../../manifests/clinical/clinical-notes/) â€” Raw K8s manifests
