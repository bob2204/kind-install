#!/bin/bash
#
# 2024-06-04: Installation du LoadBalancer Kind
#

source env.conf
TARFILE=cloud-provider-kind_0.2.0_linux_amd64.tar.gz
wget https://github.com/kubernetes-sigs/cloud-provider-kind/releases/download/v0.2.0/${TARFILE}
tar xf ${TARFILE}
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
