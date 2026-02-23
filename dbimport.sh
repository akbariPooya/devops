#!/bin/bash

echo "Starting import..."

read -p "Enter database username: " DB_USER
read -s -p "Enter database password: " DB_PASS
echo
read -p "Enter database name: " DB_NAME

for file in ./sql/*.sql; do
  echo "Importing $file"
  docker exec -i mysql mysql -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" < "$file"
done

echo "Done!"
