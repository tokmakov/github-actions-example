# Локальный action на Docker, сообщение в Telegram

Позволяет отправить сообщение в мессенджер Telegram. Текст сообщения зависит от результата задания `some-job`, которое может быть `success`, `failure`, `skipped` и `cancelled`. У репозитория должны быть два `secrets` — это `chat` (идентифкатор чата) и `token` (API токен). Для проверки работы `action` есть workflow файл.
