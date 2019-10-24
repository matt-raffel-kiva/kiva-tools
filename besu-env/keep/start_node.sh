#!/usr/bin/env bash


NETWORK_ROOT=/besu/ignore
P2P_PORT=30303
HTTP_RPC_PORT=8545

# TODO get this from command: besu --data-path=$NETWORK_ROOT/Node-1/data public-key export
# node 1 enode value eg: 3d605b598959bb2411f999ca391e8a310c18e19a6445856d4c1f01e60ac07197499e0f0be1fbe87a624fb88abe4f09accabd0cca0cfb2f3cd4f461d7c198d776@127
BOOT_NODE_PARAM=--bootnodes=enode://3d605b598959bb2411f999ca391e8a310c18e19a6445856d4c1f01e60ac07197499e0f0be1fbe87a624fb88abe4f09accabd0cca0cfb2f3cd4f461d7c198d776@127.0.0.1:30303

cwd=$(pwd)

if [[ "$NODE_ID" == "" ]]; then
    echo "node parameter was not specified (1,2,3....)"
    exit 1
fi

if ! [[ "$NODE_ID" =~ ^[0-9]+$ ]]; then
   echo "Just enter node # (1,2,3...)"
   exit 1
fi

if [[ "$2" != "" ]]; then
    NETWORK_ROOT=$2
fi

case ${NODE_ID} in
    "1")
        BOOT_NODE_PARAM=
        ;;
    "2")
        P2P_PORT=30304
        HTTP_RPC_PORT=8546
        ;;
    "3")
        P2P_PORT=30305
        HTTP_RPC_PORT=8547
        ;;
    *)
        echo unrecognized port $1
        exit 1
        ;;
esac

# TODO move a lot of this configuration to config file
/besu/besu-1.3.2/bin/besu --data-path=${NETWORK_ROOT}/Node-${NODE_ID}/data --genesis-file=${NETWORK_ROOT}/cliqueGenesis.json --min-gas-price=0 ${BOOT_NODE_PARAM} --network-id 123 --rpc-http-enabled --rpc-http-api=ADMIN,DEBUG,PERM,ETH,NET,CLIQUE --host-whitelist="*" --rpc-http-cors-origins="*" --p2p-port=${P2P_PORT} --rpc-http-port=${HTTP_RPC_PORT}
