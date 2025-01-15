#!/bin/bash

mkdir -p /data/db /var/log/mongodb
chmod -R 755 /data/db /var/log/mongodb

mongod --config /data/mongod.conf --fork

sleep 15

mongoimport --username "$MONGO_INITDB_ROOT_USERNAME" \
            --password "$MONGO_INITDB_ROOT_PASSWORD" \
            --authenticationDatabase admin \
            --db "$MONGO_INITDB_DATABASE" \
            --collection quotes \
            --file /data/quotes.json \
            --jsonArray

mongod --config /data/mongod.conf