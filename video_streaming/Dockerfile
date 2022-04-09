FROM node:16

WORKDIR /var/src/app

COPY package*.json ./

RUN npm install
RUN npm install mysql2
RUN npm install express express-fileupload express-session cookie-parser
RUN npm install axios

COPY . .

EXPOSE 8100
CMD [ "node", "server.js" ]
