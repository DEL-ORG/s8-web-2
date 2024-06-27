FROM ubuntu
RUN apt update
RUN apt install apache2 -y
RUN apt install wget
WORKDIR /var/www/html
LABEL creator=valdes
EXPOSE 80 
#RUN cd/var/www/html
