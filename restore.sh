#!/bin/bash

[[ -f ".env" ]] && source ".env"

current_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
# cd "$parent_path"

DB=${1:-${DATABASE_NAME:-uwazi_development}}
HOST=${2:-${DBHOST:-127.0.0.1}}

echo -e "\n\nDeleting $DB database"
mongo -host $HOST $DB --eval "db.dropDatabase()"
mongorestore -h $HOST dump/uwazi_development/ --db=$DB

echo "Restoring pdfs... $current_path"
rm ../uploaded_documents/*.pdf
cp ./uploaded_documents/*.pdf ../uploaded_documents/

yarn migrate
yarn reindex
