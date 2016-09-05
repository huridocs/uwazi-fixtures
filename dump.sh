#!/bin/bash
./node_modules/couchdb-dump/bin/cdbdump -d uwazi_development > uwazi.json

#!/bin/bash
./node_modules/couchdb-dump/bin/cdbdump -d uwazi_development | ./node_modules/couchdb-dump/bin/cdbmorph -f ./without_designs.js > uwazi.json

#!/bin/bash
echo "Copying conversions....";
cp ../conversions/*.json ./conversions


