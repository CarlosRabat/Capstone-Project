# Deploying Kubernetes Applications

## Prequesites

- Kubectl: <https://kubernetes.io/docs/tasks/tools/>
- Helm: <https://kubernetes.io/docs/tasks/tools/>


### (Optional) Deploy in minikube:
- Minikube installation guide: <https://minikube.sigs.k8s.io/docs/start/> |
- Install minikube and run the following command:

```bash
minikube start -p kuty-applications-cluster \
  --cpus     20 \
  --memory   20480 \
  --disk-size 20000mb \
  --driver   docker \
  --container-runtime docker
```

## Deploying Applications

- Install the apps using the following commands: 

```bash
bash install-all-apps.sh
```
If you would like to install a specific app, check for the folder apps, where you will find a file for each application

## Apps deployed

Here are the apps the install-all-apps.sh script deploys:

| Namespace                        | Script                                   | Application Name                  | GitHub URL                                                             |
|----------------------------------|------------------------------------------|-----------------------------------|------------------------------------------------------------------------|
| argo-rollouts                    | [argo-rollouts.sh](apps/argo-rollouts.sh)           | Argo Rollouts                     | https://github.com/argoproj/argo-rollouts                              |
| argocd                           | [argo-cd.sh](apps/argo-cd.sh)                       | Argo CD                           | https://github.com/argoproj/argo-cd                                    |
| clusternet-reserved              | [clusternet.sh](apps/clusternet.sh)                 | Clusternet                        | https://github.com/clusternet/clusternet                               |
| clusternet-system                | [clusternet.sh](apps/clusternet.sh)                 | Clusternet                        | https://github.com/clusternet/clusternet                               |
| flux-system                      | [flux2.sh](apps/flux2.sh)                           | Flux                              | https://github.com/fluxcd/flux2                                        |
| grafana-operator                 | [grafana-operators.sh](apps/grafana-operators.sh)   | Grafana Operator                  | https://github.com/grafana/grafana-operator                            |
| istio-system                     | [istio.sh](apps/istio.sh)                           | Istio                             | https://github.com/istio/istio                                         |
| kanister                         | [kanister.sh](apps/kanister.sh)                     | Kanister                          | https://github.com/kanisterio/kanister                                 |
| keda                             | [charts-kedacore.sh](apps/charts-kedacore.sh)       | KEDA                              | https://github.com/kedacore/charts                                     |
| kong                             | [kong.sh](apps/kong.sh)                             | Kong Ingress Controller           | https://github.com/Kong/kubernetes-ingress-controller                  |
| kube-fledged                     | [kube-fledged.sh](apps/kube-fledged.sh)             | KubeFledged                       | https://github.com/senthilrch/kube-fledged                             |
| kube-system                      | [secrets-csi-driver.sh](apps/secrets-csi-driver.sh) | Secrets Store CSI Driver          | https://github.com/kubernetes-sigs/secrets-store-csi-driver            |
| kuberay                          | [kuberay.sh](apps/kuberay.sh)                       | KubeRay                           | https://github.com/ray-project/kuberay                                 |
| kyverno                          | [kyverno.sh](apps/kyverno.sh)                       | Kyverno                           | https://github.com/kyverno/kyverno                                     |
| monitoring                       | [prometheus.sh](apps/prometheus.sh)                 | Prometheus                        | https://github.com/prometheus-community/helm-charts                    |
| openwhisk                        | [open-whisk.sh](apps/open-whisk.sh)                 | Apache OpenWhisk                  | https://github.com/apache/openwhisk-deploy-kube                        |
| podinfo                          | [pod-info.sh](apps/pod-info.sh)                     | Podinfo                           | https://github.com/stefanprodan/podinfo                                |
| polaris                          | [polaris.sh](apps/polaris.sh)                       | Polaris                           | https://github.com/FairwindsOps/polaris                                |
| reloader                         | [reloader.sh](apps/reloader.sh)                     | Reloader                          | https://github.com/stakater/Reloader                                   |
| traefik                          | [traefik.sh](apps/traefik.sh)                       | Traefik Ingress Controller        | https://github.com/traefik/traefik-helm-chart                          |
| traefik-mesh                     | [traefik-mesh.sh](apps/traefik-mesh.sh)             | Traefik Mesh                      | https://github.com/traefik/mesh                                        |
| trivy-system                     | [trivy-operator.sh](apps/trivy-operator.sh)         | Trivy Operator                    | https://github.com/aquasecurity/trivy-operator                         |
| vault                            | [vault.sh](apps/vault.sh)                           | Vault                             | https://github.com/hashicorp/vault-helm                                |
| victoria-metrics                 | [victoria-mtrics.sh](apps/victoria-mtrics.sh)       | VictoriaMetrics Cluster           | https://github.com/VictoriaMetrics/helm-charts                         |


### (Optional) Check Deployment:
- Run the following command to check the deployment of the applications. Some applications might need a few minutes be ready.

``` Bash
- kubectl get pods -A
```


