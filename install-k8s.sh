#!/bin/bash
#
# 2025-05-11
#

# En tant que root
sudo scripts.d/01-sysctl.sh
sudo scripts.d/02-install-kubectl.sh
sudo scripts.d/03-install-helm.sh
sudo scripts.d/03-install-kind-cloud-provider.sh

# En tant que stagiaire
./scripts.d/04-config-kubectl-helm.sh
./scripts.d/05-init-kind.sh
