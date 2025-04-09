#!/bin/bash

set -e

echo "Installing KubeRay Operator..."

NAMESPACE="kuberay"

# Add the KubeRay Helm repo
helm repo add kuberay https://ray-project.github.io/kuberay-helm/ || true
helm repo update

# Create namespace
kubectl create namespace $NAMESPACE || true

# Install the KubeRay Operator
helm upgrade --install kuberay-operator kuberay/kuberay-operator --namespace $NAMESPACE --create-namespace

echo "KubeRay Operator installed in namespace '$NAMESPACE'."
