{{- define "notification-preferences-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "notification-preferences-service.labels" -}}
app.kubernetes.io/name: notification-preferences-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: platform
{{- end -}}

{{- define "notification-preferences-service.selectorLabels" -}}
app.kubernetes.io/name: notification-preferences-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
