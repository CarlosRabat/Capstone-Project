#!/bin/bash

set -e

echo " Installing Clusternet ..."

NAMESPACE="clusternet-system"

# Add the Clusternet Helm repo
helm repo add clusternet https://clusternet.github.io/charts || true
helm repo update

# Create the namespace
kubectl create namespace $NAMESPACE || true

# Install the Clusternet Hub
helm upgrade --install clusternet-hub clusternet/clusternet-hub \
  --namespace $NAMESPACE \
  --create-namespace

echo "Clusternet Hub installed in namespace '$NAMESPACE'."


