FROM alpine:3.7

LABEL author="hurisheng"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk add --no-cache bash php5-fpm php5-mysql php5-gd php5-ldap php5-gettext php5-zip \
    && sed -i 's/127.0.0.1:9000/0.0.0.0:9000/g' /etc/php5/php-fpm.conf

VOLUME ["/opt/html"]

CMD [ "php-fpm5", "-F" ]