# NGINX Ingress Controller Helm Chart

## Introduction

This chart deploys the NGINX Ingress controller in your Kubernetes cluster.

## Linting helm-chart

```console
$ helm lint helm-chart
```

## helm-chart Dry run
```console
$ helm install --dry-run --debug helm-chart --generate-name
```

### Installing via Helm Repository

To install the chart with the release name my-release (my-release is the name that you choose):

For NGINX:
```console
$ helm install my-release nginx-stable/nginx-ingress
```

### Installing Using Chart Sources

To install the chart with the release name my-release (my-release is the name that you choose):

For NGINX:
```console
$ helm install my-release .
```

To uninstall/delete the release `my-release`:

```console
$ helm uninstall my-release
```

The command removes all the Kubernetes components associated with the release and deletes the release.
