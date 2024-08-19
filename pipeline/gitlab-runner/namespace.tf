resource "kubernetes_namespace" "gitlab-runner" {
  metadata {
    name = var.runner_namespace
  }
}