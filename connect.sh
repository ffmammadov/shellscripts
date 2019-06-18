#!/bin/bash
read -p "URL: " URL
COUNTER=0
while true; do
    ((COUNTER++))
    curl -s --head "$URL"
    RESPONSE_CODE=$?
    if [ $RESPONSE_CODE -eq 0 ]; then
        echo "#Try no: ${COUNTER}: SUCCESS!"
        break
    fi
    echo "#Try no: ${COUNTER}: Connecting to ${URL} FAILED"
    sleep 5
done
