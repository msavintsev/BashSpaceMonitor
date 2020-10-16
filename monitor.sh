#!/bin/bash

source config.cfg
source telegram.sh

echo "${LIMIT}"

df -Ph | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5,$1 }' | while read data;
do
    used_space=$(echo $data | awk '{print $1}' | sed s/%//g)
    partition=$(echo $data | awk '{print $2}')
    if [[ $used_space -ge $LIMIT ]]
    then
	    send_message $TELEGRAM_BOT_TOKEN $TELEGRAM_CHAT_ID
    fi
done
