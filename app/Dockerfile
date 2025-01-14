FROM node:20-alpine

WORKDIR /app

COPY ./backend/* ./backend

RUN npm install ./backend

COPY . .

EXPOSE 8128

WORKDIR /app/backend

RUN apk add openssl

RUN openssl genrsa -out ./keys/express-example-key.pem 2048

RUN openssl req -new -x509 -sha256 -key ./keys/express-example-key.pem -out ./keys/express-example.pem -days 365 -config ./keys/openssl.cnf

CMD ["npm", "start"]