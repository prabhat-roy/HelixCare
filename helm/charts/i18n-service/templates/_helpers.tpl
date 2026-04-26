{{- define "i18n-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "i18n-service.labels" -}}
app.kubernetes.io/name: i18n-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: platform
{{- end -}}

{{- define "i18n-service.selectorLabels" -}}
app.kubernetes.io/name: i18n-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
