terraform {
  backend "gcs" {
    bucket      = "name-your-bucket-1"
    prefix      = "terraform/apps/gitlab-runner/state"
    credentials = "project-credentials.json"
  }
}

data "terraform_remote_state" "kube-prometheus-stack" {
  backend = "gcs"
  config = {
    bucket      = "name-your-bucket-1"
    prefix      = "terraform/apps/kube-prometheus-stack/state"
    credentials = "project-credentials.json"
  }
}

module "gitlab-runner" {
  source = "github.com/nixys/nxs-marketplace-k8s-apps/pipeline/gitlab-runner"

  runner_chart_version                       = "0.67.0"
  runner_namespace                           = "gitlab-runner"
  gitlab_address                             = "git.example.com"
  cache_pvc_size                             = "10Gi"
  cache_pvc_storage_class                    = "standard-rwo"
  metrics_enable                             = "true"
  monitoring_ns                              = data.terraform_remote_state.kube-prometheus-stack.outputs.monitoring_ns
  project_name                               = data.terraform_remote_state.kube-prometheus-stack.outputs.project_name
  runner_gitlab_reg_token                    = "glrt-asdfasdfaewfwefwefwef"
  gitlab_runner_concurrent                   = "10"
  gitlab_runner_name                         = "k8s-runner"
  gitlab_runner_tags                         = "k8s-runner"
  gitlab_runner_config_image                 = "docker:dind"
  gitlab_runner_config_cpu_limit             = "5"
  gitlab_runner_config_cpu_request           = "1"
  gitlab_runner_config_memory_limit          = "1Gi"
  gitlab_runner_config_memory_request        = "500Mi"
  gitlab_runner_config_helper_cpu_limit      = "500m"
  gitlab_runner_config_helper_cpu_request    = "250m"
  gitlab_runner_config_helper_memory_limit   = "1Gi"
  gitlab_runner_config_helper_memory_request = "500Mi"
}
