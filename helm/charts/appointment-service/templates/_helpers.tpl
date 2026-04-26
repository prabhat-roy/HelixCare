{{- define "appointment-service.name" -}}{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- define "appointment-service.fullname" -}}{{- $n := default .Chart.Name .Values.nameOverride -}}{{- if contains $n .Release.Name -}}{{- .Release.Name | trunc 63 | trimSuffix "-" -}}{{- else -}}{{- printf "%s-%s" .Release.Name $n | trunc 63 | trimSuffix "-" -}}{{- end -}}{{- end -}}
{{- define "appointment-service.serviceAccountName" -}}{{- if .Values.serviceAccount.create -}}{{- include "appointment-service.fullname" . -}}{{- else -}}default{{- end -}}{{- end -}}
{{- define "appointment-service.labels" -}}
app.kubernetes.io/name: {{ include "appointment-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: appointments
{{- end -}}
{{- define "appointment-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "appointment-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
