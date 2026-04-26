{{- define "admin-bff.name" -}}{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- define "admin-bff.fullname" -}}{{- $n := default .Chart.Name .Values.nameOverride -}}{{- if contains $n .Release.Name -}}{{- .Release.Name | trunc 63 | trimSuffix "-" -}}{{- else -}}{{- printf "%s-%s" .Release.Name $n | trunc 63 | trimSuffix "-" -}}{{- end -}}{{- end -}}
{{- define "admin-bff.serviceAccountName" -}}{{- if .Values.serviceAccount.create -}}{{- include "admin-bff.fullname" . -}}{{- else -}}default{{- end -}}{{- end -}}
{{- define "admin-bff.labels" -}}
app.kubernetes.io/name: {{ include "admin-bff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: platform
{{- end -}}
{{- define "admin-bff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "admin-bff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
