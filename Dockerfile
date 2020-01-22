FROM php:5.6-apache

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get -yq install \
  git \
  imagemagick \
  libxml2-dev libfreetype6-dev \
  libjpeg62-turbo-dev \
  libmcrypt-dev \
  libpng-dev \
  mysql-client \
  zlib1g-dev && \
  rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
  docker-php-ext-install -j$(nproc) mysql mysqli pdo_mysql soap gd zip opcache

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY config/php.ini /usr/local/etc/php/

RUN a2enmod rewrite
