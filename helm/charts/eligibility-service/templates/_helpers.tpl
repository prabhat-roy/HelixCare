{{- define "eligibility-service.name" -}}{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- define "eligibility-service.fullname" -}}{{- $n := default .Chart.Name .Values.nameOverride -}}{{- if contains $n .Release.Name -}}{{- .Release.Name | trunc 63 | trimSuffix "-" -}}{{- else -}}{{- printf "%s-%s" .Release.Name $n | trunc 63 | trimSuffix "-" -}}{{- end -}}{{- end -}}
{{- define "eligibility-service.serviceAccountName" -}}{{- if .Values.serviceAccount.create -}}{{- include "eligibility-service.fullname" . -}}{{- else -}}default{{- end -}}{{- end -}}
{{- define "eligibility-service.labels" -}}
app.kubernetes.io/name: {{ include "eligibility-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: insurance
{{- end -}}
{{- define "eligibility-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "eligibility-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
