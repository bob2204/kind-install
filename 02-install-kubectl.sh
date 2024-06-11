#!/bin/bash
#
# 2023-12-03
#
# NB: À faire en tant que root !
#

source env.conf

# Installation de kubectl

curl -LO https://dl.k8s.io/release/${KUBE_VERSION}/bin/linux/amd64/kubectl
chmod +x kubectl
mv kubectl /usr/local/bin
