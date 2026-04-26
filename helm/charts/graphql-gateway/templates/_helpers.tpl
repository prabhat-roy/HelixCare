{{- define "graphql-gateway.name" -}}{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- define "graphql-gateway.fullname" -}}{{- $n := default .Chart.Name .Values.nameOverride -}}{{- if contains $n .Release.Name -}}{{- .Release.Name | trunc 63 | trimSuffix "-" -}}{{- else -}}{{- printf "%s-%s" .Release.Name $n | trunc 63 | trimSuffix "-" -}}{{- end -}}{{- end -}}
{{- define "graphql-gateway.serviceAccountName" -}}{{- if .Values.serviceAccount.create -}}{{- include "graphql-gateway.fullname" . -}}{{- else -}}default{{- end -}}{{- end -}}
{{- define "graphql-gateway.labels" -}}
app.kubernetes.io/name: {{ include "graphql-gateway.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: platform
{{- end -}}
{{- define "graphql-gateway.selectorLabels" -}}
app.kubernetes.io/name: {{ include "graphql-gateway.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
