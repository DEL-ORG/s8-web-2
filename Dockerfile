FROM ubuntu:latest
RUN apt update
RUN apt install apache2 -y

# RUN /var/www/html
WORKDIR /var/www/html
RUN mkdir s8danny