{{- define "care-plan.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "care-plan.labels" -}}
app.kubernetes.io/name: care-plan
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: clinical
{{- end -}}

{{- define "care-plan.selectorLabels" -}}
app.kubernetes.io/name: care-plan
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
