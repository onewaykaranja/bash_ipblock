#!/bin/bash

LOG_FILE="/home/karanja/Desktop/githubportfolio/bash/ipblock/blockips.log"
BLOCKED_IPS_FILE="/home/karanja/Desktop/githubportfolio/bash/ipblock/blocked_ips.txt"
MAX_FAILED_ATTEMPTS=3

# Start an infinite loop for continuous monitoring
while true
do

    if [[ $(grep -c "<IP_to_check>" $LOG_FILE) -ge $MAX_FAILED_ATTEMPTS ]]; then
        IP_TO_BLOCK="<IP_to_block>"
        # Check and avoid duplicate entries
        if ! grep -q "^$IP_TO_BLOCK$" "$BLOCKED_IPS_FILE"; then
            echo "$(date '+%Y-%m-%d %H:%M:%S') - Blocking IP: $IP_TO_BLOCK" >> $LOG_FILE
            echo $IP_TO_BLOCK >> $BLOCKED_IPS_FILE

        fi
    fi

    # Sleep for 10 secs before checking again
    sleep 10
done
