{{- define "profile-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "profile-service.labels" -}}
app.kubernetes.io/name: profile-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: patient
{{- end -}}

{{- define "profile-service.selectorLabels" -}}
app.kubernetes.io/name: profile-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
