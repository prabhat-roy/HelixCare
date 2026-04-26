{{- define "e-prescription.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "e-prescription.labels" -}}
app.kubernetes.io/name: e-prescription
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: telehealth
{{- end -}}

{{- define "e-prescription.selectorLabels" -}}
app.kubernetes.io/name: e-prescription
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
