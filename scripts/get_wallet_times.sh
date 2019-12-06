#!/usr/bin/env bash

TEST_ID=$1

WALLET_TIME_FILE_NAME=test_${TEST_ID}_iws_*_wallet.txt

if ! [[ "$TEST_ID" =~ ^[0-9]+$ ]]; then
   echo "Just enter test # (1,2,3...)"
   exit 1
fi

for ONE_FILE in $WALLET_TIME_FILE_NAME
do
    LINE_COUNT=0
    FILE_SLOWEST=1
    FILE_LONGEST=1
    FILE_SUM=0
    while read ONE_LINE;
    do
        RAW_MILLI_SECONDS="$(echo "$ONE_LINE" | awk '{print($NF+0)}' )"
        MILLI_SECONDS=${RAW_MILLI_SECONDS/ms/}
        LINE_COUNT=$(( LINE_COUNT + 1 ))
        FILE_SUM=$(( $MILLI_SECONDS + $FILE_SUM ))
    done < ${ONE_FILE}
    echo $LINE_COUNT $SUM $((FILE_SUM/LINE_COUNT))
done
