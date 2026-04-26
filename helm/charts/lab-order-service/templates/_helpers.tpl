{{- define "lab-order-service.name" -}}{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- define "lab-order-service.fullname" -}}{{- $n := default .Chart.Name .Values.nameOverride -}}{{- if contains $n .Release.Name -}}{{- .Release.Name | trunc 63 | trimSuffix "-" -}}{{- else -}}{{- printf "%s-%s" .Release.Name $n | trunc 63 | trimSuffix "-" -}}{{- end -}}{{- end -}}
{{- define "lab-order-service.serviceAccountName" -}}{{- if .Values.serviceAccount.create -}}{{- include "lab-order-service.fullname" . -}}{{- else -}}default{{- end -}}{{- end -}}
{{- define "lab-order-service.labels" -}}
app.kubernetes.io/name: {{ include "lab-order-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: diagnostics
{{- end -}}
{{- define "lab-order-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lab-order-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
