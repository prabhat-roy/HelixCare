{{- define "saga-orchestrator.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "saga-orchestrator.labels" -}}
app.kubernetes.io/name: saga-orchestrator
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: platform
{{- end -}}

{{- define "saga-orchestrator.selectorLabels" -}}
app.kubernetes.io/name: saga-orchestrator
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
