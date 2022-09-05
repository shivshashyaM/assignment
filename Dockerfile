FROM node:latest

WORKDIR /mnt/c/Users/hp/demo2

COPY package*.json ./

RUN npm install       

COPY . .

EXPOSE 3000          //Exposed to port 3000
CMD [ "node", "index.js" ]
