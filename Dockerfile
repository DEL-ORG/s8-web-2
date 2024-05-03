FROM ubuntu
RUN apt update
RUN apt install apache2 -y

RUN echo 'in docker file' 
RUN pwd
# RUN cd /var/www/html
WORKDIR /var/www/html

RUN echo 'in docker file' 
RUN pwd

RUN rm -rf *
COPY img /var/www/html





