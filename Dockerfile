# Base image is PHP 7.1.20 fpm jessie
FROM richarvey/nginx-php-fpm:latest
LABEL company="ShahmiMajid Corp"
LABEL maintainer="info@shahmimajid.com"

# Set up the application
COPY src/ /var/www/html/