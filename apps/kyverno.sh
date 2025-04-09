#!/bin/bash

set -e

echo "Installing Kyverno Policy Engine..."

NAMESPACE="kyverno"

# Add the Kyverno Helm repo
helm repo add kyverno https://kyverno.github.io/kyverno/ || true
helm repo update

# Create namespace
kubectl create namespace $NAMESPACE || true

# Install Kyverno via Helm
helm upgrade --install kyverno kyverno/kyverno \
    --namespace $NAMESPACE \
    --create-namespace

echo "Kyverno installed in namespace '$NAMESPACE'."
