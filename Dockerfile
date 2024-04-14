FROM ubuntu
RUN apt update
RUN apt install apche2 -y

WORKDIR /var/www/html

#RUN cd/var/www/html