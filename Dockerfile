FROM httpd

RUN apt update && \
    apt install vim -y \
    unzip \
    wget



WORKDIR /usr/local/apache2/htdocs


RUN rm -rf index.html && \

    wget https://warfiles-for-docker.s3.amazonaws.com/app/restaurant.zip && \
    unzip restaurant.zip && \
    rm -rf restaurant.zip && \
    cp -r restaurant/* . 
