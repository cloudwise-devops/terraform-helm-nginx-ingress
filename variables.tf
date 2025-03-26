
variable "helm_repos" {
  type = map(string)
  default = {
    ingress-nginx = "https://kubernetes.github.io/ingress-nginx"
  }
}

variable "nginx_ingress_namespace" {
  default = "nginx-ingress"
  type    = string
}

variable "nginx_ingress_helm_release_name" {
  default = "nginx-ingress"
  type    = string
}

variable "nginx_ingress_chart_version" {
  default = "4.12.1"
  type    = string
}

variable "nginx_ingress_replica_count" {
  default = 2
}

variable "nginx_ingress_hpa_enabled" {
  default     = true
  type        = bool
  description = "enable hpa autoscaller"
}

variable "nginx_ingress_allow_prometheus" {
  default = "false"
  type    = string
}

variable "nginx_ingress_service_monitor_label" {
  default     = "kube-prometheus-stack"
  type        = string
  description = "Labels used for prometheus label"
}

variable "helm_nginx_force_update" {
  default     = false
  type        = bool
  description = "helm chart deploy with force option"
}

variable "nginx_ingress_namespace_external" {
  default     = null
  description = "nginx ingress namespace externaly supplied"
  type        = string
}

variable "nginx_ingress_lbl_internal_enabled" {
  default     = false
  description = "Deploy nginx_ingress internal for GCP, instead of public, if 'true', no public lbl will be deployed"
}

variable "nginx_ingress_class_name" {
  default = "nginx"
  type    = string
}

variable "gcp_internal_subnet_name" {
  default     = null
  description = "vpc subnet name if nginx_ingress_lbl_internal_enabled='true'"
}

variable "nginx_ingress_deploy_on" {
  default     = "standard"
  type        = string
  description = "Nodes selector for nginx_ingress in GKE"
}
variable "allow_snippet_annotations" {
  default     = false
  type        = bool
  description = "Trigger error when a risky server-snippet or configuration-snippet is part of Ingress manifest"
}

variable "enable_annotation_validation" {
  default     = true
  type        = bool
  description = "Enable Nginx validation webhook"
}