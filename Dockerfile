# Base image is nginx-php-fpm
FROM richarvey/nginx-php-fpm:latest
LABEL company="ShahmiMajid Corp"
LABEL maintainer="info@shahmimajid.com"

# Set up the application
COPY src/ /var/www/html/