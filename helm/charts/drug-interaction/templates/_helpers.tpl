{{- define "drug-interaction.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "drug-interaction.labels" -}}
app.kubernetes.io/name: drug-interaction
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: pharmacy
{{- end -}}

{{- define "drug-interaction.selectorLabels" -}}
app.kubernetes.io/name: drug-interaction
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
