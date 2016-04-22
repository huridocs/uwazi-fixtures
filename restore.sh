#!/bin/bash

curl -X DELETE http://localhost:9200/uwazi/
curl -X DELETE http://127.0.0.1:5984/uwazi/
sleep 1
curl -X PUT http://127.0.0.1:5984/uwazi/
./node_modules/couchdb-dump/bin/cdbload -d uwazi < uwazi.json
