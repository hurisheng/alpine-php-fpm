FROM alpine:3.7

LABEL author="hurisheng"

RUN apk add --no-cache bash php5-fpm php5-mysql php5-gd php5-ldap php5-gettext php5-zip php5-openssl php5-xml php5-json \
    && addgroup -g 82 -S www-data \
    && adduser -u 100 -G www-data -g nginx -H -h /opt/html -D -S -s /sbin/nologin nginx \
    && sed -i 's|^listen\s*=\s*127.0.0.1:9000|listen = 9000|g' /etc/php5/php-fpm.conf \
    && sed -i "s|^user\s*=\s*nobody|user = nginx|g" /etc/php5/php-fpm.conf \
    && sed -i "s|^group\s*=\s*nobody|group = www-data|g" /etc/php5/php-fpm.conf

VOLUME ["/opt/html"]

CMD [ "php-fpm5", "-F" ]