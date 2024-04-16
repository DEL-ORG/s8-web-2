FROM ubuntu:latest
RUN apt update
RUN apt install apache2 -y
WORKDIR /var/www/html
RUN mkdir s8wanji
