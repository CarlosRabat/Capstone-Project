#!/bin/bash
set -e

echo "Installing nacos-k8s"

git clone --depth=1 https://github.com/nacos-group/nacos-k8s.git
cd nacos-k8s
chmod +x quick-startup.sh
./quick-startup.sh

echo "nacos-k8s deployed-----"
