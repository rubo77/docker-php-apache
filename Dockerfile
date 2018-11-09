FROM php:7.0-apache

RUN  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get -yq --no-install-recommends install \
  # Install dependencies
  git \
  imagemagick \
  libxml2-dev \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libmcrypt-dev \
  libpng-dev \
  zlib1g-dev && \
  # Fix outdated PCRE bug in Debian 8
  apt-get install -yq -t stretch libpcre3 libpcre3-dev && \
  pecl install apcu && \
  docker-php-ext-enable apcu && \
  # configure extensions
  docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
  docker-php-ext-install -j$(nproc) mysqli soap gd zip opcache && \
  # configure apache
  a2enmod rewrite && \
  # clean up
  apt-get clean && \
  apt-get -y purge \
  libxml2-dev \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libmcrypt-dev \
  libpng12-dev \
  zlib1g-dev && \
  rm -rf /var/lib/apt/lists/* /usr/src/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY config/php.ini /usr/local/etc/php/

