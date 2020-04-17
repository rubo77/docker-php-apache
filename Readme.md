Docker image with Apache, PHP 7.4 with composer (preconfigured with imagemagick, intl, mysqli, soap, gd, zip and apcu-cache) and nullmailer

Older PHP versions are available at https://github.com/rubo77/docker-php-apache/branches

## install

To create your custom image based on this repository follow these steps:

    git clone https://github.com/rubo77/docker-php-apache
    cd docker-php-apache
    git checkout 7.4-no-cache
    sudo service docker start
    sudo docker build . -t custom-php-apache:7.4-no-cache
    
## usage

In your `docker-compose.yaml` you can use this image as

    services:
      app:
        image: tan3/php-apache:latest
        # or your custom image with
        # image: custom-php-apache:7.4-no-cache

Then start with 

    docker-compose up -d
