#!/bin/bash

set -e

echo "Installing Traefik Ingress Controller..."

NAMESPACE="traefik"

# Add the Traefik Helm repo
helm repo add traefik https://traefik.github.io/charts || true
helm repo update

# Create namespace
kubectl create namespace $NAMESPACE || true

# Install Traefik via Helm
helm upgrade --install traefik traefik/traefik \
    --namespace $NAMESPACE \
    --create-namespace \
    --set service.type=LoadBalancer

echo "traefik installed in namespace '$NAMESPACE'."
