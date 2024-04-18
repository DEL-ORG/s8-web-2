FROM ubuntu:latest
RUN apt update
RUN apt install apache2 -y
WORKDIR /var/www/html
RUN mkdir s8wanjii
COPY . .




# Expose port 80 to allow external access to the web server
EXPOSE 80

# Start Apache when the container starts
CMD ["apache2ctl", "-D", "FOREGROUND"]