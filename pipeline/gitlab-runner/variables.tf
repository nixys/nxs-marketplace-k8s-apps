#==================== Helm charts ====================#
# gitlab-runner
variable "runner_chart_version" {
  description = "Version of the gitlab-runner chart in the repository https://charts.gitlab.io (not app version)."
  type        = string
  default     = "0.67.0"
}
variable "runner_namespace" {
  description = "Namespace for gitlab-runner deployment."
  type        = string
  default     = "gitlab-runner"
}
variable "gitlab_address" {
  description = "Address of gitlab instance for runner."
  type        = string
  default     = "git.example.ru"
}
variable "cache_pvc_size" {
  description = "Cache pvc size."
  type        = string
  default     = "10Gi"
}
variable "cache_pvc_storage_class" {
  description = "Cache pvc storage class."
  type        = string
  default     = "standard-rwo"
}
variable "project_name" {
  description = "The project name for k8s cluster."
  type        = string
  default     = "kubernetes-prod"
}
variable "metrics_enable" {
  description = "Enable or disable metrics in ingress-controller."
  type        = string
  default     = "true"
}
variable "monitoring_ns" {
  description = "The namespace for monitoring tools deployment."
  type        = string
  default     = "monitoring"
}
variable "gitlab_runner_concurrent" {
  description = "The concurrent threads in gitlab-runner."
  type        = string
  default     = "10"
}
variable "gitlab_runner_name" {
  description = "The gitlab-runner's name."
  type        = string
  default     = "k8s-runner"
}
variable "gitlab_runner_tags" {
  description = "The gitlab-runner's tag."
  type        = string
  default     = "k8s-runner"
}
variable "gitlab_runner_config_image" {
  description = "The namespace for monitoring tools deployment."
  type        = string
  default     = "docker:dind"
}
variable "gitlab_runner_config_cpu_limit" {
  description = "Gitlab-runner CPU limit container."
  type        = string
  default     = "5"
}
variable "gitlab_runner_config_cpu_request" {
  description = "Gitlab-runner CPU request container."
  type        = string
  default     = "1"
}
variable "gitlab_runner_config_memory_limit" {
  description = "Gitlab-runner Memory limit container."
  type        = string
  default     = "1Gi"
}
variable "gitlab_runner_config_memory_request" {
  description = "Gitlab-runner Memory request container."
  type        = string
  default     = "500Mi"
}
variable "gitlab_runner_config_helper_cpu_limit" {
  description = "The CPU limits allocation given to build helper containers."
  type        = string
  default     = "500m"
}
variable "gitlab_runner_config_helper_cpu_request" {
  description = "The CPU request allocation given to build helper containers."
  type        = string
  default     = "250m"
}
variable "gitlab_runner_config_helper_memory_limit" {
  description = "The Memory limit allocation given to build helper containers."
  type        = string
  default     = "1Gi"
}
variable "gitlab_runner_config_helper_memory_request" {
  description = "The Memory request allocation given to build helper containers."
  type        = string
  default     = "500Mi"
}
#==================== Sensetive variable ====================#
variable "runner_gitlab_reg_token" {
  description = "The registration token for adding new Runners to the GitLab server. This must be retrieved from your GitLab instance."
  type        = string
}
