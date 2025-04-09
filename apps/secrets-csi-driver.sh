#!/bin/bash

set -e

echo "Installing Secrets Store CSI Driver..."

NAMESPACE="kube-system"

# Add the CSI Driver Helm repo
helm repo add secrets-store-csi-driver https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts || true
helm repo update

# Install the CSI Driver
helm upgrade --install csi-secrets-store secrets-store-csi-driver/secrets-store-csi-driver \
    --namespace $NAMESPACE \
    --set syncSecret.enabled=true \
    --set enableSecretRotation=true

echo "Secrets Store CSI Driver installed in namespace '$NAMESPACE'."
