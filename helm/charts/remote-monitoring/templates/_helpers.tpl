{{- define "remote-monitoring.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "remote-monitoring.labels" -}}
app.kubernetes.io/name: remote-monitoring
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: telehealth
{{- end -}}

{{- define "remote-monitoring.selectorLabels" -}}
app.kubernetes.io/name: remote-monitoring
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
