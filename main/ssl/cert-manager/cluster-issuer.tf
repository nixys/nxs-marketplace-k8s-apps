resource "helm_release" "cluster-issuer" {
  name       = "cluster-issuer"
  repository = "https://registry.nixys.io/chartrepo/public"
  chart      = "nxs-universal-chart"
  version    = var.nxs_universal_chart_version

  atomic           = true

  values = [templatefile("${path.module}/cluster-issuer-input.tpl", {
    cluster_issuer_name               = var.cluster_issuer_name
    cluster_issuer_email              = var.cluster_issuer_email
    cluster_issuer_ingress_class_name = var.cluster_issuer_ingress_class_name
  })]

  depends_on = [
    helm_release.cert-manager
  ]
}
