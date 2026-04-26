{{- define "dead-letter-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "dead-letter-service.labels" -}}
app.kubernetes.io/name: dead-letter-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: platform
{{- end -}}

{{- define "dead-letter-service.selectorLabels" -}}
app.kubernetes.io/name: dead-letter-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
