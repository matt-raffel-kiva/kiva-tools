#!/usr/bin/env bash
kubectl -n goldilocks port-forward svc/goldilocks-dashboard 8080:80
