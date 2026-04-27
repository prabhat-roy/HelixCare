# clinical-nlp

Service in the analytics domain of HelixCare.

Language: Go Â· Port: 50303

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/clinical-nlp/](../../../helm/charts/clinical-nlp/) â€” Helm chart
- [manifests/analytics/clinical-nlp/](../../../manifests/analytics/clinical-nlp/) â€” Raw K8s manifests
