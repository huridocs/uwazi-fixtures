#!/bin/bash
./node_modules/couchdb-dump/bin/cdbdump -d uwazi_development | ./node_modules/couchdb-dump/bin/cdbmorph -f ./blank_state.js > uwazi_blank_state.json

