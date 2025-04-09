#!/bin/bash

set -e

echo "Installing Traefik Mesh..."

NAMESPACE="traefik-mesh"

# Add the Traefik Mesh Helm repo
helm repo add traefik-mesh https://helm.traefik.io/mesh || true
helm repo update

# Create the namespace
kubectl create namespace $NAMESPACE || true

# Install Traefik Mesh
helm upgrade --install traefik-mesh traefik-mesh/traefik-mesh \
    --namespace $NAMESPACE \
    --create-namespace

echo "Traefik Mesh installed in namespace '$NAMESPACE'."
