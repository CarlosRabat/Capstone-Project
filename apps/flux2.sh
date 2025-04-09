#!/bin/bash

set -e

echo "Installing Flux v2 ..."

NAMESPACE="flux-system"

# Add the Flux Helm repo
helm repo add fluxcd https://fluxcd-community.github.io/helm-charts || true
helm repo update

# Create the namespace
kubectl create namespace $NAMESPACE || true

# Install Flux components
helm upgrade --install flux fluxcd/flux2 \
    --namespace $NAMESPACE \
    --create-namespace

echo "Flux v2 installed in namespace '$NAMESPACE'."
