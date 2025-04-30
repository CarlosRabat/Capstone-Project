#!/bin/bash
set -e

echo "Installing KubeSphere ..."

NAMESPACE="kubesphere-system"
KS_VER="v3.4.1"

kubectl create namespace $NAMESPACE || true

kubectl apply -f https://github.com/kubesphere/ks-installer/releases/download/${KS_VER}/kubesphere-installer.yaml
kubectl apply -f https://github.com/kubesphere/ks-installer/releases/download/${KS_VER}/cluster-configuration.yaml

echo "KubeSphere resources applied in namespace '$NAMESPACE'."
