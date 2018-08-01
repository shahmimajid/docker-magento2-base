# Base image is nginx-php-fpm
FROM php:7.1.20-fpm-jessie
LABEL maintainer="Shahm Majid"

# Set up the application
RUN mkdir -p /var/www/html/
COPY src/ /var/www/html/