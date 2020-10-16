#!/bin/bash

function send_message {
	local TELEGRAM_BOT_TOKEN=$1
	local TELEGRAM_CHAT_ID=$2
	data="{\"chat_id\": $TELEGRAM_CHAT_ID, \"text\": \"$partition is used $used_space%\", \"disable_notification\": true}"
	curl -X POST \
    		-H 'Content-Type: application/json' \
		    -d "$data" \
     		https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage
}
