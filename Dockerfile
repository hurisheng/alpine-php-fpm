FROM alpine:latest

LABEL author="hurisheng"

# add user as alpine nginx, store config file in /etc/php5-conf, remove original config files
RUN apk add --no-cache bash php5-fpm php5-pdo_mysql php5-gd php5-json php5-zip \
    && addgroup -g 82 -S www-data \
    && adduser -u 100 -G www-data -g nginx -H -h /opt/html -D -S -s /sbin/nologin nginx \
    && ln -sf /dev/stderr /var/log/php-fpm.log

VOLUME [ "/etc/php5", "/opt/html" ]

CMD [ "php-fpm5", "-F" ]