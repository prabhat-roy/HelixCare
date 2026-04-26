{{- define "hipaa-audit-service.name" -}}{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- define "hipaa-audit-service.fullname" -}}{{- $n := default .Chart.Name .Values.nameOverride -}}{{- if contains $n .Release.Name -}}{{- .Release.Name | trunc 63 | trimSuffix "-" -}}{{- else -}}{{- printf "%s-%s" .Release.Name $n | trunc 63 | trimSuffix "-" -}}{{- end -}}{{- end -}}
{{- define "hipaa-audit-service.serviceAccountName" -}}{{- if .Values.serviceAccount.create -}}{{- include "hipaa-audit-service.fullname" . -}}{{- else -}}default{{- end -}}{{- end -}}
{{- define "hipaa-audit-service.labels" -}}
app.kubernetes.io/name: {{ include "hipaa-audit-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: compliance
{{- end -}}
{{- define "hipaa-audit-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "hipaa-audit-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
