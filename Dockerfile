FROM alpine:3.7

LABEL author="hurisheng"

# add user as alpine nginx, store config file in /etc/php7/conf which is volume, 
# remove original config files
RUN apk add --no-cache bash php7-fpm php7-json php7-ldap php7-xml php7-mcrypt php7-mbstring php7-session php7-openssl \
    && addgroup -g 82 -S www-data \
    && adduser -u 100 -G www-data -g nginx -H -h /opt/html -D -S -s /sbin/nologin nginx \
    && ln -sf /dev/stderr /var/log/php7/error.log

VOLUME [ "/etc/php7/php-fpm.d", "/opt/html" ]

CMD [ "php-fpm7", "-F" ]