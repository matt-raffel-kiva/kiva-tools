#!/usr/bin/env bash

TEST_ID=$1
LOOP_COUNTER=1
while IFS='' read -r line
do
    SERVER_NAME=$(echo ${line} | cut -f1 -d' ')
    if [[ ${SERVER_NAME} == protocol-identity-wallet-service* ]];
    then
        LOGFILE_NAME=test_${TEST_ID}_iws_${LOOP_COUNTER}.txt
        echo Logging ${SERVER_NAME} to ${LOGFILE_NAME}
        kubectl logs ${SERVER_NAME} > ${LOGFILE_NAME}

        ACTIVITY_FILE_NAME=test_${TEST_ID}_iws_${LOOP_COUNTER}_activity.txt
        grep -r --include="${LOGFILE_NAME}" "opening wallet for" . > ${ACTIVITY_FILE_NAME}
        LOOP_COUNTER=$((LOOP_COUNTER+1))
    fi
done < <(kubectl get pods)

