FROM php:8.1-fpm-buster

COPY docker/php/php.ini /usr/local/etc/php/php.ini
COPY . /srv/app

WORKDIR /srv/app

RUN chown -R www-data:www-data /srv/app