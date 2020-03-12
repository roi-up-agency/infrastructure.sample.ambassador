#!/usr/bin/env bash

\cp  aes.dist.yaml aes.yaml

ADDRESS=$(terraform output -json | jq '.ambassador_static_ip.value')

echo "${ADDRESS}" > ambassador_static_id.txt

# replace loadBalancerIP for service in the yaml file before applying the resource
sed -i "s/  loadBalancerIP:/  loadBalancerIP: ${ADDRESS}/g" aes.yaml

# install ambassador manually as per: https://www.getambassador.io/user-guide/manual-install/
kubectl apply -f https://www.getambassador.io/yaml/aes-crds.yaml && \
kubectl wait --for condition=established --timeout=90s crd -lproduct=aes && \
kubectl apply -f aes.yaml && \
kubectl -n ambassador wait --for condition=available --timeout=90s deploy -lproduct=aes

rm aes.yaml