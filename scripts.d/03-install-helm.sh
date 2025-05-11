#!/bin/bash
#
# 2024-01-20
#

wget https://get.helm.sh/helm-v3.14.0-linux-amd64.tar.gz
tar xf helm-v3.14.0-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin
rm -fr helm-v3.14.0-linux-amd64.tar.gz linux-amd64
