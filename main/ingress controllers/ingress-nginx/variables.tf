#==================== Optional ==================== #
variable "ingress_nginx_chart_version" {
  description = "The Helm-chart version for Nginx Ingress controller."
  type        = string
  default     = "4.11.1"
}
variable "project_name" {
  description = "The project name for k8s cluster."
  type        = string
  default     = "kubernetes-prod"
}
variable "ingress_nginx_namespace" {
  description = "The namespace for Nginx Ingress controller."
  type        = string
  default     = "ingress-nginx"
}
variable "ingress_nginx_class" {
  description = "The class for Nginx Ingress controller."
  type        = string
  default     = "nginx"
}
variable "healthcheck_node_port" {
  description = "Node port for /healthz query."
  type        = string
  default     = "32000"
}
variable "http_node_port" {
  description = "Node port for none ssl traffic."
  type        = string
  default     = "32080"
}
variable "https_node_port" {
  description = "Node port for ssl traffic."
  type        = string
  default     = "32443"
}
variable "lb_external_ip" {
  description = "External ip address of load_balancer."
  type        = string
  default     = ""
}
variable "metrics_enable" {
  description = "Enable or disable metrics in ingress-controller."
  type        = string
  default     = "true"
}
variable "ingress_controller_replicas" {
  description = "Number of replicas ingress controller."
  type        = string
}
variable "use_proxy_protocol_gcp" {
  description = "Enable or disable use proxy protocol in ingress-controller in GCP GKE."
  type        = string
  default     = "false"
}
variable "use_proxy_protocol_yc" {
  description = "Enable or disable use proxy protocol in ingress-controller in Yandex Cloud Managed-Kubernetes."
  type        = string
  default     = "false"
}
variable "proxy_real_ip_cidr" {
  description = "The string ips cidr list for proxy."
  type        = string
  default     = ""
}
variable "monitoring_ns" {
  description = "The namespace for monitoring tools deployment."
  type        = string
  default     = "monitoring"
}