#!/bin/bash
set -e

echo "Installing Crunchy Data Postgres Operator (PGO)..."

NAMESPACE="postgres-operator"

: "${YOUR_GITHUB_UN:=crunchydata}"

git clone --depth 1 "https://github.com/${YOUR_GITHUB_UN}/postgres-operator-examples.git"
cd postgres-operator-examples

kubectl apply -k kustomize/install/namespace

kubectl apply --server-side -k kustomize/install/default

echo "PGO installed in namespace '$NAMESPACE'."
