#!/bin/bash

set -e

echo "Installing HashiCorp Vault..."

NAMESPACE="vault"

# Add the HashiCorp Helm repo
helm repo add hashicorp https://helm.releases.hashicorp.com || true
helm repo update

# Create namespace
kubectl create namespace $NAMESPACE || true

# Install Vault in dev mode (for testing)
helm upgrade --install vault hashicorp/vault \
    --namespace $NAMESPACE \
    --create-namespace \
    --set "server.dev.enabled=true"

echo "Vault installed in namespace '$NAMESPACE' (dev mode)."
