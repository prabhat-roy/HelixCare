{{- define "dispensing-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "dispensing-service.labels" -}}
app.kubernetes.io/name: dispensing-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: pharmacy
{{- end -}}

{{- define "dispensing-service.selectorLabels" -}}
app.kubernetes.io/name: dispensing-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
