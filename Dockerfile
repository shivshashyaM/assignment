FROM node:latest
#this is the work directory
WORKDIR /mnt/c/Users/hp/demo2
#copy the json package
COPY package*.json ./
#install npm
RUN npm install       

COPY . .

EXPOSE 3000          #Exposed to port 3000
CMD [ "node", "index.js" ]
