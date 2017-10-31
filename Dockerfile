FROM php:5-fpm-alpine

LABEL author="hurisheng"

RUN apk update && apk add bash libpng-dev && \
    docker-php-ext-install gd mysql

VOLUME ["/opt/html"]