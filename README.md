# podinfo-deploy

This repository contains kubernetes [Kustomization](https://kustomize.io/) deployment YAMLs for [podinfo](https://github.com/stefanprodan/podinfo)

It is designed as an example for [Weave GitOps](https://github.com/weaveworks/weave-gitops)

```shell
$ kubectl apply -k .
```

Installs the base into the `default` namespace.

```shell
$ kubectl -k staging
```

Installs the base into the `podinfo-staging` namespace.

```shell
$ kubectl -k prod
```

Installs a production configuration into the `podinfo-prod` namespace.

There is also a helper script `gitops.sh` that can be used as a template.
