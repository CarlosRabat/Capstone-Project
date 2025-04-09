#!/bin/bash

set -e

echo "Installing nacos-k8s..."

NAMESPACE="nacos"

# Add the Helm repo for Nacos
helm repo add nacos https://nacos-group.github.io/nacos-k8s || true
helm repo update

# Create namespace
kubectl create namespace $NAMESPACE || true

# Install Nacos in standalone mode
helm upgrade --install nacos nacos/nacos --namespace $NAMESPACE --create-namespace

echo "nacos-k8s successfully installed in namespace '$NAMESPACE'."
