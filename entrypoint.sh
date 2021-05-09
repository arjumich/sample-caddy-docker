#!/bin/sh

#### KLOVERCLOUD CHANGES (START) ####
#### Persisting the php-fpm7 error log file####

if [ -d "/var/log/php7" ]
then
	echo '[INFO] Persistant volume mounted'
	fileCount=$(find /var/log/php7 -type f | wc -l)
	if [ $fileCount -gt 0 ]
         then
         echo "[INFO] php-log file exists"
	else
		echo "[INFO] Copying php-log files to /var/log/php7/";
		cp -r /var/log/tmp/php7/. /var/log/php7/.
		echo "[INFO] All php-log files copied to /var/log/php7";
	fi
else
	echo '[ERROR] /var/log/php7/ doesnt exists'
fi

#### KLOVERCLOUD CHANGES (END) ####

php-fpm7
caddy run --config /etc/caddy/Caddyfile --adapter caddyfile


