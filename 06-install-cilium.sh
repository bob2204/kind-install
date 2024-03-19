#!/bin/bash
#
# 2024-03-19
#

# Variables d'environnement

source env.conf

# Installation de cilium

helm upgrade --install --namespace kube-system --repo https://helm.cilium.io cilium cilium --values - <<EOF
kubeProxyReplacement: strict
k8sServiceHost: ${KIND_CLUSTER_NAME}-control-plane
k8sServicePort: 6443               # use api server port
hostServices:
  enabled: false
externalIPs:
  enabled: true
nodePort:
  enabled: true
hostPort:
  enabled: true
image:
  pullPolicy: IfNotPresent
ipam:
  mode: kubernetes
hubble:
  enabled: true
  relay:
    enabled: true
EOF
