#!/bin/bash

set -e

echo "Installing Kube-fledged..."

NAMESPACE="kube-fledged"

helm repo add kubefledged-charts https://senthilrch.github.io/kubefledged-charts/ || true
helm repo update

kubectl create namespace $NAMESPACE || true

helm upgrade --install kube-fledged kubefledged-charts/kube-fledged \
  --namespace $NAMESPACE \
  --create-namespace

echo "Kube-fledged installed in namespace '$NAMESPACE'."
