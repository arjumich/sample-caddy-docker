#!/bin/sh

echo "entrypoint initialized" > /home/caddyuser/new.txt
php-fpm7
caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
