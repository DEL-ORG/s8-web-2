FROM ubuntu
RUN apt update
RUN apt install apache2 -y
WORKDIR /var/www/html 
RUN rm -rf 
COPY * .
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]