#!/bin/bash

set -e

echo "Installing argo-cd"
# Check if it has been installed

NAMESPACE="argocd"

if helm status "$RELEASE_NAME" -n "$NAMESPACE" >/dev/null 2>&1; then
    echo "$RELEASE_NAME is already installed in $NAMESPACE."
    exit 0
fi

# Add the Argo Helm repo
helm repo add argo https://argoproj.github.io/argo-helm || true
helm repo update

# Create namespace
kubectl create namespace $NAMESPACE || true

# Install Argo CD using Helm
helm upgrade --install argocd argo/argo-cd --namespace $NAMESPACE --create-namespace

echo "argo-cd installed in namespace '$NAMESPACE'."
