FROM caddy:2.3.0-alpine

RUN apk update && apk upgrade && apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl

RUN adduser --disabled-password --gecos '' --home "/home/caddyuser" caddyuser
RUN chown caddyuser:caddyuser /etc/php7 &&  chmod 777 /etc/php7
ADD php.ini /etc/php7/conf.d/50-setting.ini
ADD php-fpm.conf /etc/php7/php-fpm.conf
RUN chown nobody:nobody /var/log/php7/error.log &&  chmod 777 /var/log/php7/error.log

ADD entrypoint.sh /entrypoint.sh
RUN chown caddyuser:caddyuser /entrypoint.sh && chmod +x /entrypoint.sh

EXPOSE 8080
EXPOSE 8443

USER caddyuser
ENTRYPOINT ["/entrypoint.sh" ]