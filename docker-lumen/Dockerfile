FROM php:7.4-rc-apache-stretch

RUN docker-php-ext-install pdo_mysql opcache \
    && a2enmod rewrite negotiation

COPY docker/php/php.ini /usr/local/etc/php/php.ini
COPY docker/apache/vhost.conf /etc/apache2/sites-available/000-default.conf
COPY . /srv/app

WORKDIR /srv/app
