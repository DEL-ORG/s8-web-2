FROM ubuntu:latest
RUN apt update
RUN apt install apache2 -y

# RUN cd /var/www/html
WORKDIR /var/www/html
RUN rm -rf *
<<<<<<< HEAD
COPY ./application-01 .
=======
COPY . .
>>>>>>> parent of 31eba93 (Added a new dockerfile)

# Expose port 80 to allow external access to the web server
EXPOSE 80

# Start Apache when the container starts
CMD ["apache2ctl", "-D", "FOREGROUND"]



