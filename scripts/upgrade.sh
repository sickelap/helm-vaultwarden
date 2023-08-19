#!/bin/sh

cd "$(dirname "$0")/.."

echo "Deploying Vault"
helm secrets upgrade -i vault charts/vaultwarden -f values.yaml
