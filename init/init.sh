#!/bin/bash

### BEGIN INIT INFO
# Provides:          Sae23
# Required-Start:    $local_fs $network
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Sae23 service
# Description:       Run Sae23 service
### END INIT INFO

IP=$(ip addr show ens33 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
cat > /etc/apache2/sites-available/redirect.conf << EOF
<VirtualHost *:80>
    ServerName $IP

    RedirectMatch ^/$ https://www.facebook.com/

    <Location /site/>
        RewriteEngine On
        RewriteRule ^(.*)$ https://www.facebook.com/ [R=301,L]
    </Location>
</VirtualHost>
EOF


sudo -b bash /var/www/html/site/launch.sh
bash /var/www/cert/conf.sh 1&>/dev/null

exit 0
