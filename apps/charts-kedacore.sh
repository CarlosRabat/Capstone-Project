#!/bin/bash

set -e

echo "Installing KedaCore..."

NAMESPACE="keda"

# Add the KEDA Helm repo
helm repo add kedacore https://kedacore.github.io/charts || true
helm repo update

# Create the namespace
kubectl create namespace $NAMESPACE || true

# Install KEDA
helm upgrade --install keda kedacore/keda \
    --namespace $NAMESPACE \
    --create-namespace

echo "KedaCore installed in namespace '$NAMESPACE'."
