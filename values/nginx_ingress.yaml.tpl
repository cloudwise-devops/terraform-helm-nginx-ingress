---
controller:
  ingressClassName: ${nginx_ingress_class_name}
  ingressClassByName: true
  ingressClassResource:
    name: ${nginx_ingress_class_name}
    enabled: true
    default: false
    controllerValue: "k8s.io/${nginx_ingress_class_name}"
  service:
    enableHttp: "false"
    externalTrafficPolicy: "Local"
    external:
      enabled: ${nginx_ingress_lbl_external_enabled}
    internal:
      enabled: ${nginx_ingress_lbl_internal_enabled}
      annotations:
        networking.gke.io/load-balancer-type: "Internal"
        networking.gke.io/internal-load-balancer-allow-global-access: "true"
  %{ if nginx_ingress_allow_prometheus == "true" }
  metrics:
    enabled: "true"
    serviceMonitor:
      enabled: "true"
      additionalLabels:
        release: "${nginx_ingress_service_monitor_label}"
  %{ endif }
  autoscaling:
    enabled: ${nginx_ingress_hpa_enabled}
    minReplicas: 1
    maxReplicas: ${nginx_ingress_replica_count}
  replicaCount: ${nginx_ingress_replica_count}
  enableCustomResources: "false"
  opentelemetry:
    enabled: "false"
  nodeSelector:
    kubernetes.io/os: linux
    cloud.google.com/gke-provisioning: "${nginx_ingress_deploy_on}"
  appprotect:
    enable: "false"
  stats:
    enabled: "true"
  config:
    enable-vts-status: "false"
    use-forwarded-headers: "true"
    log-format-escape-json: "true"
    log-format-upstream: '{ ... }'
    annotations-risk-level: "Critical"
    allow-snippet-annotations: "true"
  useConfigMap: true
  allowSnippetAnnotations: ${allow_snippet_annotations}
  enableAnnotationValidations: ${enable_annotation_validation}