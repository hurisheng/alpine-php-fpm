FROM php:5-fpm-alpine

LABEL author="hurisheng"

RUN apk add --no-cache bash freetype-dev libpng-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ \
    && docker-php-ext-install gd pdo_mysql

WORKDIR /opt/html

VOLUME ["/opt/html"]