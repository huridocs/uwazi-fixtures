#!/bin/bash

curl -X DELETE http://localhost:9200/${1:-uwazi_development}/
sleep 1
curl -X PUT http://localhost:9200/${1:-uwazi_development}/
curl -X DELETE http://127.0.0.1:5984/${1:-uwazi_development}/
sleep 1
curl -X PUT http://127.0.0.1:5984/${1-uwazi_development}/
./node_modules/couchdb-dump/bin/cdbload -d ${1:-uwazi_development} < uwazi_blank_state.json
