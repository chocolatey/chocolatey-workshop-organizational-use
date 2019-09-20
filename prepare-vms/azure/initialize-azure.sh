#!/bin/bash
resource_group=chocolatey-internalizer-images
region="North Europe"
aadClientName=chocolatey-internalizer-workshop-packer

echo "Creating image resource group $resource_group"
az group create -n $resource_group -l "$region" | jq -r .id

echo "Insert these values in CircleCI plossys-bundle environment variables"
az ad sp create-for-rbac -n $aadClientName --query "{ ARM_CLIENT_ID: appId, ARM_CLIENT_SECRET: password, ARM_TENANT_ID: tenant }"
az account show --query "{ ARM_SUBSCRIPTION_ID: id }"
