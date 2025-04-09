#!/bin/bash

set -e

echo "Installing all Applications..."
echo

for script in ./apps/*.sh; do
    echo "🔧 Running $script"
    bash "$script"
    echo
done

echo "----------All apps installed successfully!----------------"
