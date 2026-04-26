{{- define "staff-service.name" -}}{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- define "staff-service.fullname" -}}{{- $n := default .Chart.Name .Values.nameOverride -}}{{- if contains $n .Release.Name -}}{{- .Release.Name | trunc 63 | trimSuffix "-" -}}{{- else -}}{{- printf "%s-%s" .Release.Name $n | trunc 63 | trimSuffix "-" -}}{{- end -}}{{- end -}}
{{- define "staff-service.serviceAccountName" -}}{{- if .Values.serviceAccount.create -}}{{- include "staff-service.fullname" . -}}{{- else -}}default{{- end -}}{{- end -}}
{{- define "staff-service.labels" -}}
app.kubernetes.io/name: {{ include "staff-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: staff
{{- end -}}
{{- define "staff-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "staff-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
