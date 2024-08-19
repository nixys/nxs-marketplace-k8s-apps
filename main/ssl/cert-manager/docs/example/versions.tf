terraform {
  required_version = ">= v1.0.0"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.14.0"
    }
    template = {
      source = "hashicorp/template"
      version = ">= 2.2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.31.0"
    }
  }
}