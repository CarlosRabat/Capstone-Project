#!/bin/bash

set -e

echo "Installing Trivy Operator..."

NAMESPACE="trivy-system"

helm repo add aquasecurity https://aquasecurity.github.io/helm-charts/ || true
helm repo update

kubectl create namespace $NAMESPACE || true

helm upgrade --install trivy-operator aquasecurity/trivy-operator \
  --namespace $NAMESPACE \
  --create-namespace

echo "Trivy Operator installed in namespace '$NAMESPACE'."

