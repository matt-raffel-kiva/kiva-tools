#!/usr/bin/env bash
ECHO setting scale to $1
kubectl scale --replicas=$1 --all deployments/protocol-identity-wallet-service
kubectl scale --replicas=$1 --all deployments/protocol-identity-service
