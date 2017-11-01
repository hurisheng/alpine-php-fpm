FROM php:5-fpm-alpine

LABEL author="hurisheng"

RUN apk add --no-cache bash freetype libpng-dev \
    && docker-php-ext-install gd mysql

VOLUME ["/opt/html"]