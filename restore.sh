#!/bin/bash
echo -e "\n\nDeleting ${1:-uwazi_development} database"
mongo -host ${3:-127.0.0.1} ${1:-uwazi_development} --eval "db.dropDatabase()"
mongorestore -h ${3:-127.0.0.1} dump/uwazi_development/ --db=${1:-uwazi_development} 

echo "Restoring pdfs..."
rm ../uploaded_documents/*.pdf
cp ./uploaded_documents/*.pdf ${2:-..}/uploaded_documents/
