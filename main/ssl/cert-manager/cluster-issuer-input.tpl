issuerType: ClusterIssuer

issuers:
  letsencrypt-staging:
    kind: "{{ .Values.issuerType }}"
    acme:
      server: https://acme-staging-v02.api.letsencrypt.org/directory
      email: ${cluster_issuer_email}
      privateKeySecretRef:
        name: ${cluster_issuer_name}
      solvers:
      - http01:
          ingress:
            class: ${cluster_issuer_ingress_class_name}