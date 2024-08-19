resource "helm_release" "gitlab-runner" {
  name       = "gitlab-runner"
  repository = "https://charts.gitlab.io"
  chart      = "gitlab-runner"
  version    = var.runner_chart_version

  namespace        = var.runner_namespace
  atomic           = true
  max_history      = 1

  values = [templatefile("${path.module}/gitlab-runner-input.tpl", {
    runner_gitlab_reg_token                    = var.runner_gitlab_reg_token
    gitlab_ui_domain                           = var.gitlab_address
    metrics_enable                             = var.metrics_enable
    gitlab_runner_concurrent                   = var.gitlab_runner_concurrent
    gitlab_runner_name                         = var.gitlab_runner_name
    gitlab_runner_tags                         = var.gitlab_runner_tags
    gitlab_runner_config_image                 = var.gitlab_runner_config_image
    gitlab_runner_config_cpu_limit             = var.gitlab_runner_config_cpu_limit
    gitlab_runner_config_cpu_request           = var.gitlab_runner_config_cpu_request
    gitlab_runner_config_memory_limit          = var.gitlab_runner_config_memory_limit
    gitlab_runner_config_memory_request        = var.gitlab_runner_config_memory_request
    gitlab_runner_config_helper_cpu_limit      = var.gitlab_runner_config_helper_cpu_limit
    gitlab_runner_config_helper_cpu_request    = var.gitlab_runner_config_helper_cpu_request
    gitlab_runner_config_helper_memory_limit   = var.gitlab_runner_config_helper_memory_limit
    gitlab_runner_config_helper_memory_request = var.gitlab_runner_config_helper_memory_request
  })]

}
