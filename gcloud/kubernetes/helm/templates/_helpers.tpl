{{- define "decoder-acars.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 24 | trimSuffix "-" -}}
{{- end -}}

{{- define "decoder-acars.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 24 | trimSuffix "-" -}}
{{- end -}}

{{- define "decoder-acars.probes" -}}
readinessProbe:
  httpGet:
    path: /health
    port: {{ .Values.deployment.containerPort }}
  initialDelaySeconds: 30
  periodSeconds: 30
  failureThreshold: 3
livenessProbe:
  httpGet:
    path: /health
    port: {{ .Values.deployment.containerPort }}
  initialDelaySeconds: 30
  periodSeconds: 30
  failureThreshold: 3
{{- end -}}

{{- define "decoder-acars.envs" -}}
env:
  - name: PROFILE
    value: dev
  - name: JAVA_ENV
    value: dev
  - name: LOG_LEVEL
    value: INFO
  - name: SPRING_DATASOURCE_USERNAME
    value: decoder_acars
  - name: SPRING_DATASOURCE_PASSWORD
    value: "123456"
  - name: SPRING_DATASOURCE_URL
    value: jdbc:postgresql://e2-database-service/decoder_acars
  - name: RABBITMQ_HOST
    valueFrom:
      configMapKeyRef:
        name: e2-broker-configmap
        key: RABBITMQ_HOST
  - name: RABBITMQ_USERNAME
    valueFrom:
      configMapKeyRef:
        name: e2-broker-configmap
        key: RABBITMQ_USERNAME
  - name: RABBITMQ_PASSWORD
    valueFrom:
      configMapKeyRef:
        name: e2-broker-configmap
        key: RABBITMQ_PASSWORD
  - name: RABBITMQ_PORT
    valueFrom:
      configMapKeyRef:
        name: e2-broker-configmap
        key: RABBITMQ_PORT
  - name: RABBITMQ_VHOST
    valueFrom:
      configMapKeyRef:
        name: e2-broker-configmap
        key: RABBITMQ_VHOST
  - name: BUCKETEER_AWS_ACCESS_KEY_ID
    valueFrom:
      configMapKeyRef:
        name: e2-s3-configmap
        key: BUCKETEER_AWS_ACCESS_KEY_ID
  - name: BUCKETEER_AWS_SECRET_ACCESS_KEY
    valueFrom:
      configMapKeyRef:
        name: e2-s3-configmap
        key: BUCKETEER_AWS_SECRET_ACCESS_KEY
  - name: BUCKETEER_BUCKET_NAME
    valueFrom:
      configMapKeyRef:
        name: e2-s3-configmap
        key: BUCKETEER_BUCKET_NAME
  - name: REDIS_HOST
    valueFrom:
      configMapKeyRef:
        name: e2-cache-configmap
        key: REDIS_HOST
  - name: REDIS_PASSWORD
    valueFrom:
      configMapKeyRef:
        name: e2-cache-configmap
        key: REDIS_PASSWORD
  - name: REDIS_PORT
    valueFrom:
      configMapKeyRef:
        name: e2-cache-configmap
        key: REDIS_PORT
  - name: FTP_HOSTNAME
    valueFrom:
      configMapKeyRef:
        name: e2-ftp-configmap
        key: FTP_HOSTNAME
  - name: FTP_USERNAME
    valueFrom:
      configMapKeyRef:
        name: e2-ftp-configmap
        key: FTP_USERNAME
  - name: FTP_PASSWORD
    valueFrom:
      configMapKeyRef:
        name: e2-ftp-configmap
        key: FTP_PASSWORD
  - name: FTP_PORT
    valueFrom:
      configMapKeyRef:
        name: e2-ftp-configmap
        key: FTP_PORT
  - name: AUTH_USER
    valueFrom:
      configMapKeyRef:
        name: web-security-server-configmap
        key: AUTH_USER
  - name: AUTH_PASSWORD
    valueFrom:
      configMapKeyRef:
        name: web-security-server-configmap
        key: AUTH_PASSWORD
  - name: AUTH_URL
    valueFrom:
      configMapKeyRef:
        name: web-security-server-configmap
        key: AUTH_URL
  - name: LDI_URL
    value: http://decoder-ldi:8182
{{- end -}}

{{- define "decoder-acars.resources" -}}
resources:
  limits:
    memory: 512Mi
{{- end -}}