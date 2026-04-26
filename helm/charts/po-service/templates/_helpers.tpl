{{- define "po-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "po-service.labels" -}}
app.kubernetes.io/name: po-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: inventory
{{- end -}}

{{- define "po-service.selectorLabels" -}}
app.kubernetes.io/name: po-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
