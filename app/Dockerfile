FROM node:20-alpine

WORKDIR /app

COPY ./backend/* ./backend

RUN npm install ./backend

COPY . .

EXPOSE 8128

WORKDIR /app/backend

CMD ["npm", "start"]