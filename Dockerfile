FROM php:8.3-fpm

# Install dependencies
RUN apt-get update && apt-get install -y nginx bash openssl curl ca-certificates \
    && apt-get install -y libpq-dev --no-install-recommends\
    && apt-get upgrade -y \
    && apt-get install -y nodejs npm wget \
    && docker-php-ext-configure pgsql --with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo_pgsql pgsql \
    && apt install -y zlib1g-dev g++ git libicu-dev zip libzip-dev zip \
    && docker-php-ext-install intl opcache pdo pdo_mysql \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip

WORKDIR /var/www/symfony

# Copy application files
COPY . /var/www/symfony

# Copy configurations
# COPY ../docker/build/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY ./docker/build/php/php-fpm.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./docker/build/php/opcache.ini /usr/local/etc/php/conf.d/
COPY ./docker/build/php/custom.ini /usr/local/etc/php/conf.d/

COPY ./init-user-db.sh /docker-entrypoint-initdb.d/

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Symfony CLI
RUN curl -sS https://get.symfony.com/cli/installer | bash -s -- --install-dir=/usr/local/bin

# Copy composer.json and package.json to the docker image
COPY app/composer.json /var/www/composer.json
COPY app/package.json /var/www/package.json
RUN composer install
RUN npm install
# EXPOSE  9000

#CMD ["php-fpm", "-F"]

