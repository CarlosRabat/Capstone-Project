#!/bin/bash

set -e

echo "Installing reloader..."

NAMESPACE="reloader"

# Add the Helm repo for Stakater
helm repo add stakater https://stakater.github.io/stakater-charts || true
helm repo update

# Create namespace
kubectl create namespace $NAMESPACE || true

# Install Reloader via Helm
helm upgrade --install reloader stakater/reloader --namespace $NAMESPACE --create-namespace
#--set reloader.watchGlobally=true

echo "reloader installed in namespace '$NAMESPACE'."
