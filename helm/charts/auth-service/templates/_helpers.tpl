{{- define "auth-service.name" -}}{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- define "auth-service.fullname" -}}{{- $n := default .Chart.Name .Values.nameOverride -}}{{- if contains $n .Release.Name -}}{{- .Release.Name | trunc 63 | trimSuffix "-" -}}{{- else -}}{{- printf "%s-%s" .Release.Name $n | trunc 63 | trimSuffix "-" -}}{{- end -}}{{- end -}}
{{- define "auth-service.serviceAccountName" -}}{{- if .Values.serviceAccount.create -}}{{- include "auth-service.fullname" . -}}{{- else -}}default{{- end -}}{{- end -}}
{{- define "auth-service.labels" -}}
app.kubernetes.io/name: {{ include "auth-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: identity
{{- end -}}
{{- define "auth-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "auth-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
