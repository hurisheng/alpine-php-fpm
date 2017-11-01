FROM php:5-fpm-alpine

LABEL author="hurisheng"

RUN apk add --no-cache bash freetype-dev libpng-dev \
    && docker-php-ext-install gd mysql

VOLUME ["/opt/html"]