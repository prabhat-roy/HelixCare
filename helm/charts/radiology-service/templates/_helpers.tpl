{{- define "radiology-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "radiology-service.labels" -}}
app.kubernetes.io/name: radiology-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: diagnostics
{{- end -}}

{{- define "radiology-service.selectorLabels" -}}
app.kubernetes.io/name: radiology-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
