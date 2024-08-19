terraform {
  backend "gcs" {
    bucket      = "name-your-bucket-1"
    prefix      = "terraform/apps/cert-manager/state"
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

module "cert-manager" {
  source = "github.com/nixys/nxs-marketplace-k8s-apps/main/ssl/cert-manager"

  # Cert-Manager
  cert_manager_chart_version        = "1.15.2"
  cert_manager_namespace            = "cert-manager"
  # Monitoring
  metrics_enable                    = "true"
  monitoring_ns                     = data.terraform_remote_state.kube-prometheus-stack.outputs.monitoring_ns
  project_name                      = data.terraform_remote_state.kube-prometheus-stack.outputs.project_name

  # ClusterIssuer
  cluster_issuer_name               = "letsencrypt"
  cluster_issuer_email              = "test@gmail.com"
  cluster_issuer_ingress_class_name = "nginx"
}
