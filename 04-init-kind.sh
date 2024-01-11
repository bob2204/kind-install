#!/bin/bash
#
# 2023-12-03
#

# Initialisation du clusteur 'stage'

curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
chmod +x ./kind
./kind create cluster --name=stage --config=kcluster.yml

# Attendre un peu...

echo "Attendre un peu (30s)"
sleep 30

# Installation du CNI *Calico*

kubectl apply -f calico.yml
