#!/bin/bash

[[ -f ".env" ]] && source ".env"

DB=${1:-${DATABASE_NAME:-uwazi_development}}
HOST=${2:-${DBHOST:-127.0.0.1}}

echo -e "\n\nDeleting $DB database"
mongo -host $HOST $DB --eval "db.dropDatabase()"
mongorestore -h $HOST uwazi-fixtures/dump/uwazi_development/ --db=$DB

echo "Restoring pdfs..."
rm ./uploaded_documents/*
cp ./uwazi-fixtures/uploaded_documents/* ./uploaded_documents/

echo "Running migrations..."
node ./prod/app/api/migrations/migrate.js
echo "Reindexing..."
node ./prod/database/reindex_elastic.js
