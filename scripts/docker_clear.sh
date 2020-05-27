#!/usr/bin/env bash
docker volume prune -f
docker rmi $(docker images | grep '^<none>' | awk '{print $3}')
