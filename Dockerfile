FROM alpine:latest

LABEL author="hurisheng"

# add user as alpine nginx, store config file in /etc/php7/conf which is volume, 
# remove original config files
RUN apk add --no-cache bash php-fpm php-mysqli \
    && ln -sf /dev/stderr /var/log/php/error.log

VOLUME [ "/etc/php83/php-fpm.d", "/etc/php83/conf.d", "/opt/html" ]

EXPOSE 9000

CMD [ "php-fpm", "-F" ]
