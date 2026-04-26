{{- define "dicom-viewer.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "dicom-viewer.labels" -}}
app.kubernetes.io/name: dicom-viewer
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: helixcare
helixcare.io/domain: diagnostics
{{- end -}}

{{- define "dicom-viewer.selectorLabels" -}}
app.kubernetes.io/name: dicom-viewer
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
