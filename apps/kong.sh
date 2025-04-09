#!/bin/bash

set -e

echo "Installing Kong Ingress Controller..."

NAMESPACE="kong"

# Add the Kong Helm repo
helm repo add kong https://charts.konghq.com || true
helm repo update

# Create namespace
kubectl create namespace $NAMESPACE || true

# Install Kong with Ingress Controller enabled
helm upgrade --install kong kong/kong \
    --namespace $NAMESPACE \
    --create-namespace \
    --set ingressController.installCRDs=false \
    --set proxy.type=LoadBalancer

echo "Kong Ingress Controller installed in namespace '$NAMESPACE'."
