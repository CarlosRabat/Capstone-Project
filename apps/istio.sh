#!/bin/bash

set -e

echo "🚀 Installing Istio (default profile)..."

ISTIO_VERSION="1.22.0" # You can change this to the latest stable release

# Download and install istioctl
curl -L https://istio.io/downloadIstio | ISTIO_VERSION=$ISTIO_VERSION sh -
cd istio-$ISTIO_VERSION
export PATH=$PWD/bin:$PATH

# Install Istio using the default profile
istioctl install --set profile=default -y

echo "Istio installed in namespace 'istio-system'."
