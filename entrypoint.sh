#!/usr/bin/env sh

set -e

if [ "$MH_OUTGOING_SMTP" = "" ]; then
    if [ "$MH_OUTGOING_SMTP_CONTENT" != "" ]; then
        echo "$MH_OUTGOING_SMTP_CONTENT" > /outgoing-smtp.json
        export MH_OUTGOING_SMTP=/outgoing-smtp.json
    elif [ "$MH_OUTGOING_SMTP_HOST" != "" ]; then
        echo "{ \"default\": { \"name\": \"default\", \"host\": \"$MH_OUTGOING_SMTP_HOST\", \"port\": \"${MH_OUTGOING_SMTP_PORT-25}\", \"email\": \"$MH_OUTGOING_SMTP_EMAIL\" } }" > /outgoing-smtp.json
        export MH_OUTGOING_SMTP=/outgoing-smtp.json
    fi
fi

exec "$@"
