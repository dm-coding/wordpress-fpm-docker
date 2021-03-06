#!/bin/bash
#Purpose: plain-text backups of SQL databases

MYSQL_IMAGE="gists/mariadb"
BACKUPS=/var/backups/sql
mkdir -p $BACKUPS

for d in /var/www/*; do
    domain=$(basename $d)
    if [ -e "$d/.env" ]; then
		if ! grep -xq "NOBACKUPS=true" "$d/.env" ; then
            docker run --net docker_sqlnet --env-file "$d/.env" --name $domain.backupdb --rm $MYSQL_IMAGE sh -c 'mysqldump -u$DB_USER $DB_NAME' | gzip -9 > $BACKUPS/$domain.sql.gz
        fi
    fi
done
