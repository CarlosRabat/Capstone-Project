#!/bin/bash

set -e

echo "Installing VictoriaMetrics Cluster..."

NAMESPACE="victoria-metrics"

helm repo add vm https://victoriametrics.github.io/helm-charts/ || true
helm repo update

kubectl create namespace $NAMESPACE || true

helm upgrade --install victoria-metrics vm/victoria-metrics-cluster \
  --namespace $NAMESPACE \
  --create-namespace

echo "VictoriaMetrics Cluster installed in namespace '$NAMESPACE'."
