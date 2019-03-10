FROM node:latest

WORKDIR /demo-docker-with-volume-nodejs-hello

COPY . /demo-docker-with-volume-nodejs-hello

ENV PORT=3000

RUN npm install

EXPOSE $PORT

ENTRYPOINT ["node", "app.js"]