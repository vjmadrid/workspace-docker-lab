FROM node:latest

WORKDIR /demo-docker-nodejs-hello

COPY . /demo-docker-nodejs-hello

ENV PORT=3000

RUN npm install

EXPOSE $PORT

ENTRYPOINT ["node", "app.js"]