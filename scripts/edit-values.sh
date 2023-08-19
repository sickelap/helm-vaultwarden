#!/bin/sh

DIR="$(dirname "$0")"
KEY=$(grep recipient "${DIR}/../values.yaml" | awk '{print $3}')

echo "Decrypting values.yaml with sops..."
sops -d --age "${KEY}" "${DIR}/../values.yaml" > "${DIR}/../values.plain.yaml"

echo "Editing values.yaml..."
vim "${DIR}/../values.plain.yaml"

echo "Encrypting values.yaml with sops..."
sops -e --age "${KEY}" "${DIR}/../values.plain.yaml" > "${DIR}/../values.yaml"

#rm -rf "${DIR}/../values.plain.yaml"
