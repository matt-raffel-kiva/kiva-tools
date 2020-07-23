#!/usr/bin/env bash
# python3 ./aca-py provision --wallet-type basic --seed 000000000000000000000000Steward1
# python3 ./aca-py start --inbound-transport http 0.0.0.0 8123 --admin 0.0.0.0 8124 --admin-insecure-mode --outbound-transport http

python3 ./aca-py start \
    --inbound-transport http 0.0.0.0 8223 \
    --admin 0.0.0.0 8224 --admin-insecure-mode \
    --outbound-transport http \
    --webhook-url "http://127.0.0.1:5000/v1/controller/faber" \
    --endpoint http://0.0.0.0:8223 \
    --ledger-pool-name "pool1" \
    --genesis-file "./genesis_local" \
    --wallet-type "indy" \
    --wallet-name "faber_wallet" \
    --wallet-key "walletKey004" \
    --seed "000000000000000000000000Steward1"

    # --wallet-storage-type config.walletStorageType \

