{{- define "clinician-bff.name" -}}{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- define "clinician-bff.fullname" -}}{{- $n := default .Chart.Name .Values.nameOverride -}}{{- if contains $n .Release.Name -}}{{- .Release.Name | trunc 63 | trimSuffix "-" -}}{{- else -}}{{- printf "%s-%s" .Release.Name $n | trunc 63 | trimSuffix "-" -}}{{- end -}}{{- end -}}
{{- define "clinician-bff.serviceAccountName" -}}{{- if .Values.serviceAccount.create -}}{{- include "clinician-bff.fullname" . -}}{{- else -}}{{- default "default" .Values.serviceAccount.name -}}{{- end -}}{{- end -}}
{{- define "clinician-bff.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
app.kubernetes.io/name: {{ include "clinician-bff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: platform
{{- end -}}
{{- define "clinician-bff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "clinician-bff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
