FROM alpine:3.7

LABEL author="hurisheng"

# add user as alpine nginx, store config file in /etc/php5-conf, remove original config files
RUN apk add --no-cache bash php5-fpm php5-pdo_mysql php5-gd \
    && addgroup -g 82 -S www-data \
    && adduser -u 100 -G www-data -g nginx -H -h /opt/html -D -S -s /sbin/nologin nginx \
    && ln -sf /dev/stderr /var/log/php-fpm.log \
    && rm /etc/php5/php-fpm.conf /etc/php5/php.ini

VOLUME [ "/etc/php5/conf", "/opt/html" ]

CMD [ "php-fpm5", "-F", "-c", "/etc/php5/conf", "-y", "/etc/php5/conf/php-fpm.conf" ]