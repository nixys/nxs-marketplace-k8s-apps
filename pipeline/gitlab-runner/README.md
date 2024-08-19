# gitlab-runner

## Introduction

This is a terraform module for gitlab-runner for building pipeline resources.

## Features

- Comfortable management structure
- Supported integration with kube-prometheus-stack

## Settings

| Option | Type | Required | Default value |Description |
| --- | ---  | --- | --- | --- |
| `runner_chart_version`                       | String | No  | "0.67.0" | Version of the gitlab-runner chart in the repository https://charts.gitlab.io (not app version)." |
| `runner_namespace`                           | String | No  | "gitlab-runner" | Namespace for gitlab-runner deployment. |
| `gitlab_address`                             | String | No  | "git.example.ru" | Address of gitlab instance for runner. |
| `cache_pvc_size`                             | String | No  | "10Gi" | Cache pvc size. |
| `cache_pvc_storage_class`                    | String | No  | "standard-rwo" | Cache pvc storage class. |
| `gitlab_runner_concurrent`                   | String | No  | "10" | The concurrent threads in gitlab-runner. |
| `gitlab_runner_name`                         | String | No  | "k8s-runner" | The gitlab-runner's name. |
| `gitlab_runner_tags`                         | String | No  | "k8s-runner" | The gitlab-runner's tag. |
| `gitlab_runner_config_image`                 | String | No  | "docker:dind" | The namespace for monitoring tools deployment. |
| `gitlab_runner_config_cpu_limit`             | String | No  | "5" | Gitlab-runner CPU limit container. |
| `gitlab_runner_config_cpu_request`           | String | No  | "1" | Gitlab-runner CPU request container. |
| `gitlab_runner_config_memory_limit`          | String | No  | "1Gi" | Gitlab-runner Memory limit container. |
| `gitlab_runner_config_memory_request`        | String | No  | "500Mi" | Gitlab-runner Memory request container. |
| `gitlab_runner_config_helper_cpu_limit`      | String | No  | "500m" | The CPU limits allocation given to build helper containers. |
| `gitlab_runner_config_helper_cpu_request`    | String | No  | "250m" | The CPU request allocation given to build helper containers. |
| `gitlab_runner_config_helper_memory_limit`   | String | No  | "1Gi" | The Memory limit allocation given to build helper containers. |
| `gitlab_runner_config_helper_memory_request` | String | No  | "500Mi" | The Memory request allocation given to build helper containers. |
| `metrics_enable`                             | String | No  | "true" | Enable or disable metrics in elasticsearch. |
| `monitoring_ns`                              | String | No  | "monitoring" | The namespace for monitoring tools deployment. |
| `project_name`                               | String | No  | "kubernetes-prod" | The project name for k8s cluster. |
| `runner_gitlab_reg_token`                    | String | Yes | - | The registration token for adding new Runners to the GitLab server. This must be retrieved from your GitLab instance. |

## Example

Usage example located in this [directory](docs/example).
