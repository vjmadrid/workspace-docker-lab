# demo-docker-nodejs-hello

Project that show a message "Hello World" ("All a classic of any development" :-) ) along with information of the event that triggered it through a request REST (HTTP event) but all mounted inside a docker image

## Technological Stack

* Windows 10
* Docker (https://www.docker.com/)
* Node 8.10

## Prerequisites

Install the following tools and frameworks:

* Node.js 8.10 or higher
* Code editor
* Postman

Recommendation of extra elements to be installed :

* Visual Studio Code: https://code.visualstudio.com/
* nvm: https://github.com/creationix/nvm
* npm: https://www.npmjs.com/ (ver. 6.5.0)

## Installation

General

* Install and configure Node.js (Document **workspace-nodejs-lab/doc/README-install-configure-node.md**)
* Install and configure NVM (Document **workspace-nodejs-lab/doc/README-install-configure-nvm.md**)

Specifics

* Prepare and configure a generic project (Document **workspace-nodejs-lab/doc/README-prepare-configure-project.md**)

This project follows the basic construction steps

1. Creating a directory for the project : **demo-docker-nodejs-hello**
2. To be located inside this directory
3. Execute the command to create a basic archetype 

```bash
npm init -y
```

4. Verify the existence of the file package.json

NOTA : No aplicar más pasos del documento

## Project preparation

### Installation of project dependencies

* **[express](https://www.npmjs.com/package/express)** : Framework for web applications in node

Execute the following command

```bash
npm install express --save
```

Install the latest version of the express framework

Check that it appears in the package.json file


### Creating an application file

An application file is created in the project directory with the name : **app.js**

For example :

``` js
const express = require('express')

const app = express()

const PORT_DEFAULT = 3000

const port_env = process.env.PORT || PORT_DEFAULT

app.get('/', (req, res) => res.send('Hello World!'))

app.get('/hello', async (req, res, next) => {
    console.log('info', '[APP EXPRESS] hello...' );
    res.status(200).send('Hello World!' + new Date().toTimeString())
})

app.listen(port_env, () => console.log(`[APP EXPRESS] hello app listening on port ${port_env}!`))
```

We test the application by executing the following command

```bash
node app.js
```

You can verify that everything went well by means of the log that will show the following message : **[APP EXPRESS] hello app listening on port 3000!**

Execute through the browser or Postman: **http://localhost:3000/hello**

The message should be displayed with the time of execution and in the log the message: **info [APP EXPRESS] hello...**

### Creating a "Dockerfile" file

A file will be designed to take care of :

* Copy the files from the example to the docker container
* To install the dependencies of the project
* Open a port to make it accessible
* Start the application

Example of the file "Dockerfile" :

```bash
FROM node:latest

WORKDIR /demo-docker-nodejs-hello

COPY . /demo-docker-nodejs-hello

ENV PORT=3000

RUN npm install

EXPOSE $PORT

ENTRYPOINT ["node", "app.js"]
```

Explanation :

* FROM node:latest** : Select the last image of "Docker Hub" based on Ubuntu and that has Nodejs installed.
* **WORKDIR /demo-docker-nodejs-hello** : Situate the project directory
* **COPY . /demo-docker-nodejs-hello** : Copy the current route into another one
* ENV PORT=3000** : Sets the environment variable PORT to 3000
* RUN npm install** : Execution of the installation of the project dependencies
* EXPOSE $PORT** : Opens the port 3000 to be accessible from outside.
* ENTRYPOINT ["node", "app.js"]** : Indication of how to start the application


### Construction of the image based on the "Dockerfile" file

We are located inside the project directory and execute the following command

```bash
docker build -t vjmadrid/node:latest .
```

In my case I have put "vjmadrid" but could put another element, this will help locate the image after

From this moment on, you will be in charge of downloading everything necessary as well as doing the operations indicated in the file.

Check if the image is available with the following command

```bash
docker images
```

Our image should appear with certain assigned values : image_id, creation date, size, respository and tag


### Start the container based on image

Execute the following command on the previously created image 

```bash
docker run -p 8000:3000 vjmadrid/node
```

In this case the parameter **"-p 8000:3000"** has been added to map port 8000 with 3000

Note : You can run in the background by adding the parameter **"-d "** (Daemon Mode) -> The output of the execution will not be visible.

Check if the container is started we will execute the following command

```bash
docker ps
```

Verify that everything went well by means of the log that will show the following message : **[APP EXPRESS] hello app listening on port 3000!**

Execute through the browser or Postman: **http://localhost:8000/hello**

The message should be displayed with the time of execution and in the log the message: **info [APP EXPRESS] hello...**


Execute the following command on the previously created image 

```bash
docker run -p 8000:3000 --name demo-docker-nodejs-hello vjmadrid/node
```
With name is more easy to refer a the container in the management (stop, rm, etc.)

The operations can chain with &&

```bash
docker stop demo-docker-nodejs-hello && docker rm demo-docker-nodejs-hello && docker build -t vjmadrid/node:latest . && docker run -p 8000:3000 --name demo-docker-nodejs-hello vjmadrid/node
```


### Stop the container

Check if the container is started we will execute the following command

```bash
docker ps
```

If we see it in the list we will execute the following command 

```bash
docker stop <container_id>
```

> This command sends a SIGTERM signal next to the SIGKILL signal after a considered period of time -> Free resources and save the status
>
>You can use the kill command that sends a SIGKILL signal, which means that it may not do well to release resources and store the state,
not recommended for use in production


### Application of interactive mode

Facilitates entry into a running container

```bash
docker ps
```

If we see it in the list we will execute the following command 

```bash
docker exec -it <container_id> <shell>

#example
docker exec -it 40f bash
```

You can run anything inside the container

For example :

```bash
docker exec <container_id> node app.js
```

### Delete the container

Check if the image is found

```bash
docker images
```

You can run anything inside the container

```bash
docker rm <container_id>
```


## Testing

Depends on the project

## Deploy

N/A

## Versioning

**Note :** [SemVer](http://semver.org/) is used for the versioning. 
To see the available versions access the repository tags

## Authors

* **Víctor Madrid**
