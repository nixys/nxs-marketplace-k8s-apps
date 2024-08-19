#==================== Helm chart =============#
variable "cert_manager_namespace" {
  description = "The Cert Manager namespace."
  type        = string
  default     = "cert-manager"
}
variable "cert_manager_chart_version" {
  description = "The Helm-chart version for Cert Manager."
  type        = string
  default     = "1.15.2"
}
#================== Cluster Issuer ================ #
variable "nxs_universal_chart_version" {
  description = "The Helm-chart version for nxs-universal-chart."
  type        = string
  default     = "2.8.0"
}
variable "cluster_issuer_name" {
  description = "The ClusterIssuer resource."
  type        = string
  default     = "letsencrypt"
}
variable "cluster_issuer_email" {
  description = "The ClusterIssuer email."
  type        = string
  default     = "test@gmail.com"
}
variable "cluster_issuer_ingress_class_name" {
  description = "The ClusterIssuer IngressClassName."
  type        = string
  default     = "nginx"
}
variable "metrics_enable" {
  description = "Enable or disable metrics in cert-manager."
  type        = string
  default     = "true"
}
variable "monitoring_ns" {
  description = "The namespace for monitoring tools deployment."
  type        = string
  default     = "monitoring"
}
variable "project_name" {
  description = "The project name for k8s cluster."
  type        = string
  default     = "kubernetes-prod"
}
