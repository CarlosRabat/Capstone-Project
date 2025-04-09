#!/bin/bash

set -e

echo "Installing Polaris..."

NAMESPACE="polaris"

# Add the Fairwinds Helm repo
helm repo add fairwinds-stable https://charts.fairwinds.com/stable || true
helm repo update

# Create namespace
kubectl create namespace $NAMESPACE || true

# Install Polaris dashboard via Helm
helm upgrade --install polaris fairwinds-stable/polaris \
    --namespace $NAMESPACE \
    --create-namespace \
    --set dashboard.enabled=true

echo "Polaris installed in namespace '$NAMESPACE'."
