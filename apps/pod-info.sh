#!/bin/bash

set -e

echo "Installing Podinfo..."

NAMESPACE="podinfo"

# Add the Helm repository for Podinfo
helm repo add podinfo https://stefanprodan.github.io/podinfo || true
helm repo update

# Create the namespace if it doesn't exist
kubectl create namespace $NAMESPACE || true

# Install Podinfo
helm upgrade --install podinfo podinfo/podinfo --namespace $NAMESPACE --create-namespace

echo "Podinfo installed in namespace '$NAMESPACE'."
