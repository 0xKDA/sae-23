#!/bin/bash

/usr/bin/mysqldump -u archiviste -ppasswordforarchivist  -B sae_23 --skip-add-locks --lock-tables=false --single-transaction --quick --order-by-primary --triggers --events | openssl aes-256-cbc -e -salt -out /var/www/backup/encrypted_backup_name.sql.enc -k password
