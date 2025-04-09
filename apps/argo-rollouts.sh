#!/bin/bash

set -e

echo "Installing Argo Rollouts..."

NAMESPACE="argo-rollouts"

# Create namespace
kubectl create namespace $NAMESPACE || true

# Install Argo Rollouts using the official manifest
kubectl apply -n $NAMESPACE -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml

echo "Argo Rollouts installed in namespace '$NAMESPACE'."
