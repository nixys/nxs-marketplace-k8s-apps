resource "kubernetes_persistent_volume_claim" "cache" {
  metadata {
    name = "cache"
    namespace = var.runner_namespace
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = var.cache_pvc_size
      }
    }
    storage_class_name = var.cache_pvc_storage_class
  }

  depends_on = [
    kubernetes_namespace.gitlab-runner
  ]
}
