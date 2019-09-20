#!/bin/sh
set -e

if [ -z "${CIRCLE_TAG}" ]; then
  echo "Environment variable CIRCLE_TAG must be set"
  exit 5
fi

dns_prefix=${CIRCLE_TAG%%-*}
number_of_machines=${CIRCLE_TAG#*-}

cd prepare-vms/azure/terraform
apk add pwgen

./create-passwords.sh
mkdir -p /tmp/workspace
if [ -f machines.md ]; then
  cp machines.md /tmp/workspace
fi

terraform init
terraform apply \
  -var "count=$number_of_machines" \
  -var "dns_prefix=$dns_prefix" \
  -var "group_name=${dns_prefix}-${number_of_machines}-chocolatey-workshop-internalizer" \
  -var "account=${dns_prefix}${number_of_machines}workshop" \
  -auto-approve
