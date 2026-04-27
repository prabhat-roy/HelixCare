# dicom-viewer

Service in the diagnostics domain of HelixCare.

Language: Go Â· Port: 50103

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/dicom-viewer/](../../../helm/charts/dicom-viewer/) â€” Helm chart
- [manifests/diagnostics/dicom-viewer/](../../../manifests/diagnostics/dicom-viewer/) â€” Raw K8s manifests
