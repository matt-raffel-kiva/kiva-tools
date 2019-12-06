#!/usr/bin/env bash
# kubectl delete pod protocol-auth-service-56b77cc649-lhflc
# kubectl delete pod protocol-gateway-7ff8c459f4-6grrh
# kubectl delete pod protocol-gateway-7ff8c459f4-zx9f5
# kubectl delete pod protocol-identity-service-694c7c7655-65hs7
# kubectl delete pod protocol-identity-wallet-service-546968d6d7-9l47z
# kubectl delete pod protocol-wallet-sync-service-765c57d489-88zbl


while IFS='' read -r line
do
    SERVER_NAME=$(echo ${line} | cut -f1 -d' ')
    if [[ ${SERVER_NAME} == protocol-identity-wallet-service* ]];
    then
        echo resetting ${SERVER_NAME}
        kubectl delete pod ${SERVER_NAME}
    fi
    if [[ ${SERVER_NAME} == protocol-wallet-sync-service* ]];
    then
        echo resetting ${SERVER_NAME}
        kubectl delete pod ${SERVER_NAME}
    fi
done < <(kubectl get pods)
