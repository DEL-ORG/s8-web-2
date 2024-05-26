FROM ubuntu:latest
RUN apt update
RUN apt install apache2 -y -TIA

# RUN cd /var/www/html
WORKDIR /var/www/html
RUN rm -rf *
COPY ./application-02 . 

# Expose port 80 to allow external access to the web server
EXPOSE 8080

# Start Apache when the container starts
CMD ["apache2ctl", "-D", "FOREGROUND"]


