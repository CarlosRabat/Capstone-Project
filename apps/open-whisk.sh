#!/bin/bash

set -e

echo "Installing  OpenWhisk..."

NAMESPACE="openwhisk"

kubectl create namespace $NAMESPACE || true

git clone https://github.com/apache/openwhisk-deploy-kube.git
cd openwhisk-deploy-kube

helm dependency update helm/openwhisk

helm upgrade --install owdev helm/openwhisk \
  --namespace $NAMESPACE \
  --create-namespace

cd ..
rm -rf openwhisk-deploy-kube

echo "OpenWhisk installed in namespace '$NAMESPACE'."

