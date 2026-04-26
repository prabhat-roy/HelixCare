{{- define "geo-address-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "geo-address-service.labels" -}}
app.kubernetes.io/name: geo-address-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: platform
{{- end -}}

{{- define "geo-address-service.selectorLabels" -}}
app.kubernetes.io/name: geo-address-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
