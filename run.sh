#!/bin/bash

mongod &

until mongo --eval "print(\"waited for connection\")"
do
    sleep 2
done
mongoimport --db "$MONGODB_DATABASE" \
            --collection quotes \
            --file /tmp/quotes.json \
            --jsonArray \
            --username "$MONGODB_USER" \
            --password "$MONGODB_PASSWORD" \
            --authenticationDatabase admin

fg