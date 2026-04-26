{{- define "claim-submission.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "claim-submission.labels" -}}
app.kubernetes.io/name: claim-submission
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: insurance
{{- end -}}

{{- define "claim-submission.selectorLabels" -}}
app.kubernetes.io/name: claim-submission
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
