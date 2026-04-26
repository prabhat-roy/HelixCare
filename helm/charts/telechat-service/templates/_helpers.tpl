{{- define "telechat-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "telechat-service.labels" -}}
app.kubernetes.io/name: telechat-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: telehealth
{{- end -}}

{{- define "telechat-service.selectorLabels" -}}
app.kubernetes.io/name: telechat-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
