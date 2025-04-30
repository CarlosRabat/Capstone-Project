#!/bin/bash
set -e

echo "Installing Metrics Server"

kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

echo "Metrics server deployed in namespace kube-system"
