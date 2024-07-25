#!/bin/bash

# Versions
NGINX_VERSION=${NGINX_VERSION-1.5.7}
PCRE_VERSION=${PCRE_VERSION-8.21}
HEADERS_MORE_VERSION=${HEADERS_MORE_VERSION-0.23}
PHP_VERSION=${PHP_VERSION-7.4.0}

# Download URLs
nginx_tarball_url=http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
pcre_tarball_url=http://garr.dl.sourceforge.net/project/pcre/pcre/${PCRE_VERSION}/pcre-${PCRE_VERSION}.tar.bz2
headers_more_nginx_module_url=https://github.com/agentzh/headers-more-nginx-module/archive/v${HEADERS_MORE_VERSION}.tar.gz
php_tarball_url=http://us2.php.net/get/php-${PHP_VERSION}.tar.gz/from/this/mirror

# ...

# Download and extract PHP source
echo "Downloading $php_tarball_url"
curl -L $php_tarball_url | tar xzv

# Build PHP with FPM
(
	cd php-${PHP_VERSION}
	./configure --enable-fpm
	make && make install
)

# ...
