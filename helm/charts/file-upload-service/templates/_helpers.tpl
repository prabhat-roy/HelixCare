{{- define "file-upload-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "file-upload-service.labels" -}}
app.kubernetes.io/name: file-upload-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: platform
{{- end -}}

{{- define "file-upload-service.selectorLabels" -}}
app.kubernetes.io/name: file-upload-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
