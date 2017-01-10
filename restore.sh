#!/bin/bash

echo -e "\n\nDeleting ${1:-uwazi_development} database"
curl -X DELETE http://127.0.0.1:5984/${1:-uwazi_development}/
sleep 1
echo -e "\nCreating ${1:-uwazi_development} database"
curl -X PUT http://127.0.0.1:5984/${1-uwazi_development}/
echo -e "\nimporting uwazi.json into ${1:-uwazi_development} database"
./node_modules/couchdb-dump/bin/cdbload -d ${1:-uwazi_development} < uwazi.json
sleep 1
echo -e "\nreseting views on ${1:-uwazi_development} database"
../couchdb/restore_views.sh

echo "Restoring uploaded files..."
rm ../uploaded_documents/*.pdf
cp ./uploaded_documents/*.pdf ${2:-..}/uploaded_documents/
