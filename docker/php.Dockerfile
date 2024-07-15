FROM php:8.3-fpm
RUN apt-get install -y bash \
    && apt update \
    && apt-get install -y libpq-dev \
    && apt-get upgrade -y \
    && apt-get install -y nodejs npm wget\
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo_pgsql pgsql \
    && apt install -y zlib1g-dev g++ git libicu-dev zip libzip-dev zip \
    && docker-php-ext-install intl opcache pdo pdo_mysql \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip
COPY build/php/opcache.ini /usr/local/etc/php/conf.d/
COPY build/php/custom.ini /usr/local/etc/php/conf.d/
WORKDIR /var/www/symfony_docker

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sS https://get.symfony.com/cli/installer | bash -s -- --install-dir=/usr/local/bin


#CMD ["php", "-S", "0.0.0.0:80", "-t", "/var/www/symfony_docker"]

EXPOSE 80
