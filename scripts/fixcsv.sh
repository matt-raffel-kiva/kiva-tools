#!/usr/bin/env bash

while IFS= read -r line; do
    v2=${line#"["}
    v3=${v2#"]"}
    echo "Text read from file: $v3"
done < $1
