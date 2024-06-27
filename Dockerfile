FROM httpd
LABEL maintainer="Valdes Kengne"
RUN apt -y update && \
    apt -y install wget && \
    apt -y install unzip

WORKDIR /usr/local/apache2/htdocs/

RUN rm -rf * && \
    wget https://linux-devops-course.s3.amazonaws.com/WEB+SIDE+HTML/covid19.zip && \
    unzip covid19.zip && \
    cp -R covid19/* . && \
    rm -rf covid19.zip && \
    rm -rf covid19

USER root
ENTRYPOINT ["httpd-foreground"]
EXPOSE 80
