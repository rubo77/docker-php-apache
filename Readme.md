Docker image PHP with apache, composer and some other tools

## install

    sudo service docker start
    sudo docker build . -t custom-php-apache:7.4
    
## usage

in your `docker-compose.yaml` you can use this image as

    services:
      app:
        image: custom-php-apache:7.4

Then start with 

    docker-compose up
