#!/bin/bash

set -e

echo "Installing Kanister..."

NAMESPACE="kanister"

# Add the Kanister Helm repo
helm repo add kanister https://charts.kanister.io || true
helm repo update

# Create namespace
kubectl create namespace $NAMESPACE || true

# Install the Kanister operator
helm upgrade --install kanister-operator kanister/kanister-operator \
    --namespace $NAMESPACE \
    --create-namespace

echo "Kanister Operator installed in namespace '$NAMESPACE'."
