gitlabUrl: https://${gitlab_ui_domain}
runnerRegistrationToken: ${runner_gitlab_reg_token}
concurrent: ${gitlab_runner_concurrent}
checkInterval: 5

rbac:
  create: true

runners:
  name: ${gitlab_runner_name}
  locked: true
  tags: ${gitlab_runner_tags}
  config: |
    [[runners]]
      executor = "kubernetes"
      cache_dir = "/cache"
      clone_url = "https://${gitlab_ui_domain}"
      [runners.kubernetes]
        image = "${gitlab_runner_config_image}"
        pull_policy = ["always", "if-not-present"]
        cpu_limit = "${gitlab_runner_config_cpu_limit}"
        cpu_request = "${gitlab_runner_config_cpu_request}"
        memory_limit = "${gitlab_runner_config_memory_limit}"
        memory_request = "${gitlab_runner_config_memory_request}"
        helper_cpu_limit = "${gitlab_runner_config_helper_cpu_limit}"
        helper_cpu_request = "${gitlab_runner_config_helper_cpu_request}"
        helper_memory_limit = "${gitlab_runner_config_helper_memory_limit}"
        helper_memory_request = "${gitlab_runner_config_helper_memory_request}"

volumes:
  - name: runner-cache
    persistentVolumeClaim:
      claimName: cache

volumeMounts:
  - name: runner-cache
    mountPath: /cache

envVars:
  - name: KUBERNETES_NODE_TOLERATIONS
    value: 'node-role.kubernetes.io/master:NoSchedule'

metrics:
  enabled: ${metrics_enable}
  portName: metrics
  port: 9252
  serviceMonitor:
    enabled: ${metrics_enable}
    labels:
      release: "kube-prometheus-stack"

service:
  enabled: ${metrics_enable}
