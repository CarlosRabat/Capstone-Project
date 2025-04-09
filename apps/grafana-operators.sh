#!/bin/bash

set -e

echo "Installing Grafana Operator..."

NAMESPACE="grafana-operator"

# Add the Grafana Operator Helm repo
helm repo add grafana-operator https://grafana.github.io/helm-charts || true
helm repo update

# Create namespace
kubectl create namespace $NAMESPACE || true

# Install the Grafana Operator
helm upgrade --install grafana-operator grafana-operator/grafana-operator \
    --namespace $NAMESPACE \
    --create-namespace

echo "Grafana Operator installed in namespace '$NAMESPACE'."
