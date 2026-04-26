{{- define "demographics.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "demographics.labels" -}}
app.kubernetes.io/name: demographics
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: patient
{{- end -}}

{{- define "demographics.selectorLabels" -}}
app.kubernetes.io/name: demographics
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
