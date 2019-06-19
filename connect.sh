#!/bin/bash
#This scripts try to send HEAD request to given URL and stops when it succeed 
if [ -z $1 ]; then
    read -p "URL: " URL
else
    URL=$1
fi
COUNTER=0
while true; do
    ((COUNTER++))
    curl -s --head "$URL"
    RESPONSE_CODE=$?
    if [ $RESPONSE_CODE -eq 0 ]; then
        echo "Try no: #${COUNTER}: SUCCESS!"
        break
    fi
    echo "Try no: #${COUNTER}: Connecting to ${URL} FAILED"
    sleep 5
done
