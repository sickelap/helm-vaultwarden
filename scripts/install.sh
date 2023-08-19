#!/bin/sh

cd "$(dirname "$0")/.."

echo "Deploying Vault"
helm secrets install vault charts/vaultwarden -f values.yaml
