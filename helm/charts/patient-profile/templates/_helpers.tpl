{{- define "patient-profile.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "patient-profile.labels" -}}
app.kubernetes.io/name: patient-profile
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: patient
{{- end -}}

{{- define "patient-profile.selectorLabels" -}}
app.kubernetes.io/name: patient-profile
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
