#!/usr/bin/env bash


LOOKING_FOR=$1

while IFS='' read -r line
do
    SERVER_NAME=$(echo ${line} | cut -f1 -d' ')
    echo ${SERVER_NAME}
    if [[ ${SERVER_NAME} == *${LOOKING_FOR}* ]];
    then
        kubectl exec -it ${SERVER_NAME} sh
        exit
    fi
done < <(kubectl get pods)
