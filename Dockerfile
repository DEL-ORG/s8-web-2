FROM node:latest
RUN apt install wget -y 
RUN apt install unzip -y


WORKDIR /usr/app

COPY  package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

VOLUME ["/usr/app/versage"]  

CMD ["npm", "start"]i 
