FROM alpine:latest

LABEL author="hurisheng"

# add user as alpine nginx, store config file in /etc/php7/conf which is volume, 
# remove original config files
RUN apk add --no-cache bash php-fpm php-mysqli \
    && addgroup -g 82 -S www-data \
    && adduser -u 100 -G www-data -g nginx -H -h /opt/html -D -S -s /sbin/nologin nginx \
    && ln -sf /dev/stderr /var/log/php/error.log

VOLUME [ "/etc/php/php-fpm.d", "/opt/html" ]

CMD [ "php-fpm", "-F" ]
