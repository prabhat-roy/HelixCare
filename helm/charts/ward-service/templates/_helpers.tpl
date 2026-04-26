{{- define "ward-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "ward-service.labels" -}}
app.kubernetes.io/name: ward-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: ward-management
{{- end -}}

{{- define "ward-service.selectorLabels" -}}
app.kubernetes.io/name: ward-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
