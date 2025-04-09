#!/bin/bash

set -e

echo "Installing Prometheus Monitoring Stack..."

NAMESPACE="monitoring"

# Add Prometheus Community Helm repo
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts || true
helm repo update

# Create namespace
kubectl create namespace $NAMESPACE || true

helm install prometheus prometheus-community/prometheus --namespace monitoring --create-namespace

echo "Prometheus Monitoring Stack installed in namespace '$NAMESPACE'."
