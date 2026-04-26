{{- define "reminder-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "reminder-service.labels" -}}
app.kubernetes.io/name: reminder-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: appointments
{{- end -}}

{{- define "reminder-service.selectorLabels" -}}
app.kubernetes.io/name: reminder-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
