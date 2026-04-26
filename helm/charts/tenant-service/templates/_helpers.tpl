{{- define "tenant-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "tenant-service.labels" -}}
app.kubernetes.io/name: tenant-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: platform
{{- end -}}

{{- define "tenant-service.selectorLabels" -}}
app.kubernetes.io/name: tenant-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
