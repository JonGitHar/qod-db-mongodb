#!/bin/bash

mongod --fork --logpath /var/log/mongodb.log --bind_ip_all

sleep 15

mongoimport --username $MONGO_INITDB_ROOT_USERNAME --password $MONGO_INITDB_ROOT_PASSWORD --authenticationDatabase admin --db $MONGO_INITDB_DATABASE --collection quotes --file /data/quotes.json --jsonArray

mongod --config /etc/mongod.conf