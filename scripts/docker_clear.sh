#!/usr/bin/env bash
docker volume prune -f
docker rmi $(docker images -q | sort | uniq)
