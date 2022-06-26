#!/bin/bash
set -e

api_url="https://api.telegram.org/bot$INPUT_TOKEN/sendMessage"
header="Content-Type: application/json; charset=utf-8"
json='{\"chat_id\":\"%s\",\"text\":\"%s\"}'
printf -v data "$json" "$INPUT_CHAT" "$INPUT_TEXT"

curl -X POST -H "$header" -d "$data" $api_url > /dev/null 2>&1
echo 'done entrypoint.sh'
