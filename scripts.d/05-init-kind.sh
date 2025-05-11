#!/bin/bash
#
# 2023-12-03
# 2024-02-22
#

set -o nounset
set -o errexit

# Chargement des variables d'environnement

source env.conf

# Création du répertoire de travail

mkdir -p $WORKDIR/data

# Initialisation du clusteur 'stage'

curl -Lo ./kind https://kind.sigs.k8s.io/dl/${KIND_VERSION}/kind-linux-${KIND_ARCH}
chmod +x ./kind

export IPV4=$(ip -f inet address show ${KIND_IFACE}|grep -Po 'inet \K[\d.]+')
./kind create cluster --name=${KIND_CLUSTER_NAME} --config=<(envsubst < kcluster.yml)

# Installation du Kubelet Serving Certificate Approver

kubectl apply -f https://raw.githubusercontent.com/alex1989hu/kubelet-serving-cert-approver/main/deploy/standalone-install.yaml

# Attendre un peu...

echo "Attendre un peu (30s)"
sleep 30

# Installation du CNI *Calico*

kubectl apply -f calico-v3.30.0.yml

