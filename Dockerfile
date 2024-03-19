FROM php:8.1-apache
WORKDIR /var/www/html
COPY . .
RUN apt install composer
RUN apt install php-curl php-xml
RUN apt install php-gd
RUN apt install php-zip
RUN composer update
RUN composer install
RUN php artisan vendor:publish --provider "L5Swagger/L5SwaggerServiceProvider"
RUN php artisan l5-swagger:generate
RUN php artisan serve