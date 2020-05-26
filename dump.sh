#!/bin/bash
mongodump -h ${2:-127.0.0.1} --db ${1:-uwazi_development} -o dump

echo "Copying uploaded files...";
rm ./uploaded_documents/*
cp ../uploaded_documents/* ./uploaded_documents
echo "DONE !";
