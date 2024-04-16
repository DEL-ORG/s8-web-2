FROM ubuntu:latest
RUN apt update
RUN apt install apache2 -y
WORKDIR /var/www/html
RUN rm -rf *
cp -r* .
