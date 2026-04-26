{{- define "email-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "email-service.labels" -}}
app.kubernetes.io/name: email-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: communications
{{- end -}}

{{- define "email-service.selectorLabels" -}}
app.kubernetes.io/name: email-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
