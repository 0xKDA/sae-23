#!/bin/bash

#openssl aes-256-cbc -d -salt -in /var/www/backup/encrypted_backup_name.sql.enc -k An0UthTe3kticStr5ongPass | /usr/bin/mysqldump -u root -ptoto -B sae_23 --skip-add-locks --lock-tables=false --single-transaction --quick --order-by-primary --triggers --events > /var/www/backup/decrypted_backup_name.sql
openssl aes-256-cbc -d -salt -in /var/www/backup/encrypted_backup_name.sql.enc -k password > /var/www/backup/decrypted_backup_name.sql
