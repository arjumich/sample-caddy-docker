# Caddy App
#####
### For local Testing

**Build**
```sh
docker build -t klovercloud/caddy:latest .
```
**Run**
```sh
docker run --rm --read-only --tmpfs=/tmp --name testcaddy -p 8080:8080 -v /home/arjun/Docker-vol/caddy-php-log:/var/log/php7/ -v $PWD/Caddyfile:/etc/caddy/Caddyfile -v $PWD/index.php:/usr/share/caddy/index.php -v caddy_data:/data klovercloud/caddy:latest
```
### Notes
- php error log file needes to be persisted for Read only rootfs.
- using php through php_fastcgi (php 7.3)
- main server configuration file here is the Caddyfile. Caddy requires no other conguration of it's own on any other directory or file. 
- The default config file simply serves files from /usr/share/caddy. Sample index file is there for testing. 
- default listening port is 8080 and 8443
