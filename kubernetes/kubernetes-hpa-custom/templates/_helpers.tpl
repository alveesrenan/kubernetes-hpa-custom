{{/*
Name of the chart.
*/}}
{{- define "kubernetes-hpa-custom.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "kubernetes-hpa-custom.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Namespace used by the chart label.
*/}}
{{- define "kubernetes-hpa-custom.namespace" -}}
  {{- if .Values.namespaceOverride -}}
    {{- .Values.namespaceOverride -}}
  {{- else -}}
    {{- .Release.Namespace -}}
  {{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "kubernetes-hpa-custom.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "kubernetes-hpa-custom.labels" -}}
app.kubernetes.io/name: {{ include "kubernetes-hpa-custom.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: {{ .Values.application.component }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ include "kubernetes-hpa-custom.chart" . }}
{{- end -}}

{{/*
Deployment probes.
*/}}
{{- define "kubernetes-hpa-custom.probes" -}}
readinessProbe:
  httpGet:
    path: /actuator/health
    port: {{ .Values.deployment.containerPort }}
  initialDelaySeconds: 15
  periodSeconds: 10
  failureThreshold: 3
livenessProbe:
  httpGet:
    path: /actuator/health
    port: {{ .Values.deployment.containerPort }}
  initialDelaySeconds: 15
  periodSeconds: 10
  failureThreshold: 3
{{- end -}}

{{/*
Deployment environments.
*/}}
{{- define "kubernetes-hpa-custom.envs" -}}
env:
  - name: PROFILE
    value: dev
  - name: JAVA_ENV
    value: dev
  - name: LOG_LEVEL
    value: INFO
{{- end -}}

{{- define "kubernetes-hpa-custom.resources" -}}
resources:
  requests:
    memory: 400Mi
    cpu: 0.1
  limits:
    memory: 512Mi
{{- end -}}
