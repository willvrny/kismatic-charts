{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "notes.prometheus.name" -}}
{{- default "prometheus" .Values.prometheus.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a fully qualified alertmanager name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "notes.prometheus.alertmanager.fullname" -}}
{{- $name := default "prometheus" .Values.prometheus.nameOverride -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.prometheus.alertmanager.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a fully qualified Prometheus server name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "notes.prometheus.server.fullname" -}}
{{- $name := default "prometheus" .Values.prometheus.nameOverride -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.prometheus.server.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}