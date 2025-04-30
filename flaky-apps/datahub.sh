set -e

echo "Installing DataHub ..."

NAMESPACE="datahub"

helm repo add datahub https://acryldata.github.io/datahub-helm/ || true
helm repo update

kubectl create namespace $NAMESPACE || true

helm upgrade --install datahub datahub/datahub \
  --namespace $NAMESPACE \
  --create-namespace

echo "DataHub installed in namespace '$NAMESPACE'."
