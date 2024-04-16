FROM ubuntu
RUN apt update
RUN apt install apache2 -y
RUN useradd wanji
RUN mkdir /wanji
