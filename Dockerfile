FROM alpine:latest

LABEL author="hurisheng"

# add user as alpine nginx, store config file in /etc/php7/conf which is volume, 
# remove original config files
RUN apk add --no-cache bash php-fpm php-mysqli php-gd \
    && adduser -u 100 -G www-data -H -h /opt/html -D -S -s /sbin/nologin php-fpm \
    && ln -sf /dev/stderr /var/log/php83/error.log

VOLUME [ "/etc/php83/php-fpm.d", "/etc/php83/conf.d", "/opt/html" ]

EXPOSE 9000

CMD [ "php-fpm83", "-F" ]
