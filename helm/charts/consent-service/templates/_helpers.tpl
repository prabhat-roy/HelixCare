{{- define "consent-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "consent-service.labels" -}}
app.kubernetes.io/name: consent-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: compliance
{{- end -}}

{{- define "consent-service.selectorLabels" -}}
app.kubernetes.io/name: consent-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
