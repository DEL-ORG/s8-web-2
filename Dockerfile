FROM ubuntu:latest
RUN apt update
RUN apt install apache2 -y

# RUN cd /var/www/html
WORKDIR /var/www/html
RUN mkdir s8tia
RUN mkdir tonton




