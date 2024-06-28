FROM node:latest
RUN apt install wget -y 
RUN apt install unzip -y
RUN wget https://group5-braincells.s3.amazonaws.com/node-ex-website.zip 
RUN unzip node-ex-website.zip 
RUN rm -rf node-ex-website.zip

WORKDIR /usr/app

COPY  package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

VOLUME ["/usr/app/versage"]  

CMD ["npm", "start"]i 
