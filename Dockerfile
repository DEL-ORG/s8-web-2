FROM ubuntu:latest
RUN apt update
RUN apt install apache2 -y

# RUN cd /var/www/html
WORKDIR /var/www/html
RUN rm -rf *
COPY . .





