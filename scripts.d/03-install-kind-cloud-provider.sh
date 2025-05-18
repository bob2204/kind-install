#!/bin/bash
#
# 2024-06-04: Installation du LoadBalancer Kind
#

source env.conf
CLOUD_PROVIDER_VERSION=0.6.0
TARFILE=cloud-provider-kind_${CLOUD_PROVIDER_VERSION}_linux_amd64.tar.gz
wget https://github.com/kubernetes-sigs/cloud-provider-kind/releases/download/v${CLOUD_PROVIDER_VERSION}/${TARFILE}
tar xf ${TARFILE} cloud-provider-kind
mv cloud-provider-kind /usr/local/bin
rm ${TARFILE}

cat > /etc/systemd/system/cloud-provider-kind.service << EOF
[Unit]
Description=Kind Cloud LoadBalancer

[Service]
Type=simple
ExecStart=/usr/local/bin/cloud-provider-kind


[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable --now cloud-provider-kind.service
