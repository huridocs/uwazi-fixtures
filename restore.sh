#!/bin/bash

curl -X DELETE http://localhost:9200/${1:-uwazi}/
curl -X DELETE http://127.0.0.1:5984/${1-uwazi}/
sleep 1
curl -X PUT http://127.0.0.1:5984/${1-uwazi}/
./node_modules/couchdb-dump/bin/cdbload -d ${1:-uwazi} < uwazi.json
