#!/usr/bin/env bash

TEST_ID=$1

WALLET_TIME_FILE_NAME=test_${TEST_ID}_iws_*_wallet.txt

if ! [[ "$TEST_ID" =~ ^[0-9]+$ ]]; then
   echo "Just enter test # (1,2,3...)"
   # exit 1
fi

POD=1
for ONE_FILE in $WALLET_TIME_FILE_NAME
do
    awk '{ val=$NF+0;
           if(NR==1)  {min=val;max=val}
           if(max<val){max=val}
           if(min>val){min=val}
           sum+=val
         } END {
              avg=sum/NR
              print(sum,avg,max,min)
         }' ${ONE_FILE}  | {

            read SUM AVG MAX MIN
            echo "------------------"
            echo "FOR POD $POD: AVG = $AVG MAX = $MAX MIN = $MIN"

        }
    POD=$((POD + 1))
done
