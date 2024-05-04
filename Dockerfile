FROM ubuntu
RUN apt update
RUN apt install apache2 -y

# RUN cd /var/www/html
WORKDIR /var/www/html
RUN rm -rf *
COPY ./application-02 .

# Expose port 80 to allow external access to the web server
EXPOSE 80

# enable apache service in the container
CMD ["apache2ctl", "-D", "FOREGROUND"]



