#!/bin/bash
set -e

api_url="https://api.telegram.org/bot${INPUT_TOKEN}/sendMessage"
header='Content-Type: application/json; charset=utf-8'

message='Задание завершилось успешно'
[[ $INPUT_RESULT == 'failure' ]] && message='Задание завершилось ошибкой'
[[ $INPUT_RESULT == 'skipped' ]] && message='Задание было пропущено'
[[ $INPUT_RESULT == 'cancelled' ]] &&  message='Задание было отменено'

json='{\"chat_id\":\"%s\",\"text\":\"%s\"}'
printf -v data "$json" "$INPUT_CHAT" "$message"

curl -X POST -H "$header" -d "$data" $api_url > /dev/null 2>&1
