{{- define "sms-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "sms-service.labels" -}}
app.kubernetes.io/name: sms-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: communications
{{- end -}}

{{- define "sms-service.selectorLabels" -}}
app.kubernetes.io/name: sms-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
