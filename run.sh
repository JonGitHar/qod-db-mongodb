#!/bin/bash
mongod --fork --logpath /var/log/mongodb.log

sleep 5

mongo <<EOF
use qod
db.createCollection('quotes')
EOF

mongoimport --db qod --collection quotes --file /data/quotes.json --jsonArray

tail -f /dev/null