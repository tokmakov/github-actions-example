#!/bin/bash
set -e

api_url="https://api.telegram.org/bot${INPUT_TOKEN}/sendMessage"
header='Content-Type: application/json; charset=utf-8'

message='Задание завершилось успешно'
if [[ $INPUT_RESULT == 'failure' ]]; then
    message='Задание завершилось ошибкой'
fi
if [[ $INPUT_RESULT == 'skipped' ]]; then
    message='Задание было пропущено'
fi
if [[ $INPUT_RESULT == 'cancelled' ]]; then
    message='Задание было отменено'
fi

json='{\"chat_id\":\"%s\",\"text\":\"%s\"}'
printf -v data "$json" "$INPUT_CHAT" "$message"

curl -X POST -H "$header" -d "$data" $api_url > /dev/null 2>&1
