Docker image with Apache, PHP 7.4 with composer (preconfigured with imagemagick,
apcu, intl, mysqli, soap, gd, zip and opcache) and nullmailer

Older PHP versions are available at https://github.com/caplod/docker-php-apache/branches

## install

To create your custom image based on this repository follow these steps:

    git clone https://github.com/caplod/docker-php-apache
    cd docker-php-apache
    sudo service docker start
    sudo docker build . -t custom-php-apache:7.4
    
## usage

In your `docker-compose.yaml` you can use this image as

    services:
      app:
        image: tan3/php-apache:latest
        # or your custom image with
        # image: custom-php-apache:7.4

Then start with 

    docker-compose up -d
