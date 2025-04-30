#!/bin/bash
set -e

echo "Installing Otomi Core (APL)..."

NAMESPACE="otomi-core"

git clone https://github.com/linode/apl-core.git
cd apl-core

cat <<EOF > values.yaml
otomi:
  version: main
EOF

kubectl create namespace $NAMESPACE || true
helm upgrade --install my-apl-release chart/apl \
  --namespace $NAMESPACE \
  --create-namespace \
  -f values.yaml

echo "Otomi Core installed in namespace '$NAMESPACE'."
