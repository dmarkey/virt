#!/bin/sh

if [ ! -f /usr/local/bin/k3d ]; then
  wget -O /usr/local/bin/k3d https://github.com/k3d-io/k3d/releases/download/v5.4.4/k3d-linux-arm64
  chmod +x /usr/local/bin/k3d
fi

if [ ! -f /usr/local/bin/kubectl ]; then
  wget -O /usr/local/bin/kubectl https://dl.k8s.io/release/v1.24.3/bin/linux/arm64/kubectl
  chmod +x /usr/local/bin/kubectl
fi

k3d cluster create --network podman --k3s-arg --flannel-backend=host-gw@server:* --env IPTABLES_MODE=legacy@server:* --no-lb --api-port 127.0.0.1:6443
