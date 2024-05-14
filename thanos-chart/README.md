## Introduction
This is really intended as a toy to just run on a laptop in Docker Desktop or Rancher's little Kubernetes offering to prove services.

Adaptation from [thanos](https://artifacthub.io/packages/helm/bitnami/thanos) chart instructions.

## installation
```sh
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm upgrade --install kube-prometheus --values values-kube-prometheus.yaml bitnami/kube-prometheus
helm upgrade --install thanos --values values-thanos.yaml bitnami/thanos
```

## Use
Port-forward services- eg `kubectl get svc`, then `kubectl port-forward svc/thanos-query 9090:9090`, and access `http://localhost:9090` in your browser.
