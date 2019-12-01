# demo-docker-nodejs-hello

Project that show a message "Hello World" ("All a classic of any development" :-) ) along with information of the event that triggered it through a request REST (HTTP event) but all mounted inside a docker image

This projects stands out for:

* Provides **API REST** : Basic Configuration





## Technological Stack

* Node 8.10
* [Docker](https://www.docker.com/) - Container Technology

Dependencies with architecture projects

N/A

Third Party Dependencies

* ...





## Prerequisites

Install the following tools and frameworks:

* Node.js 8.10 or higher
* Code editor
* Postman
* Docker installed (19+)

Recommendation of extra elements to be installed :

* Visual Studio Code: https://code.visualstudio.com/
* nvm: https://github.com/creationix/nvm
* npm: https://www.npmjs.com/ (ver. 6.5.0)





## Installation

General

* Install and configure Node.js (Document **[workspace-doc/doc/node.js/README-Installation-Configuration-Node.md](https://github.com/vjmadrid/workspace-doc/blob/master/doc/node.js/README-Installation-Configuration-Node.md)**)
* Install and configure NVM (Document **[workspace-doc/doc/node.js/README-Installation-Configuration-Nvm.md](https://github.com/vjmadrid/workspace-doc/blob/master/doc/node.js/README-Installation-Configuration-Nvm.md)**)

Specifics

* Prepare and configure a generic project (Document **[workspace-doc/doc/node.js/README-Prepare-Configuration-Project.md](https://github.com/vjmadrid/workspace-doc/blob/master/doc/node.js/README-Prepare-Configuration-Project.md)**)

This project follows the basic construction steps

Steps to follow

* Start a terminal
* To be located in the PATH of installation (the place where the project is located)
* Verify that the file "pom.xml" is available



This project follows the basic construction steps

* Creating a directory for the project : **demo-docker-nodejs-hello**
* To be located inside this directory

1. Execute the command to create a basic archetype 

```bash
npm init -y
```

2. Verify the existence of the file package.json

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


Test the application by executing the following command

```bash
node app.js
```

You can verify that everything went well by means of the log that will show the following message : **[APP EXPRESS] hello app listening on port 3000!**

Execute through the browser or Postman: **http://localhost:3000/hello**

The message should be displayed with the time of execution and in the log the message: **info [APP EXPRESS] hello...**





## Testing

N/A





## Deploy

Spring Boot

* Deploy Method 1 : Application (Spring Boot File)
* Deploy Method 2 : Spring Boot Run
* Deploy Method 3 : Execute JAR



### Deploy Method 1 : Application (Spring Boot File)

1. Execute Application.java File

* Default 
* Configure Java "Run Configurations" IDE -> Use "Environment" with -Dspring.profiles.active=<id_profile>


### Deploy Method 2 : Spring Boot Run

1. Execute the following command

```bash
mvn spring-boot:run
```

Optional : use profile


### Deploy Method 3 : Execute JAR

Use Spring profiles with Maven Profiles -> Special Integration

* spring.profiles.active=@spring.profiles.active@
* enable resource filtering

Package the application in a single/fat JAR file (executable JAR + All dependencies + Embedded Servlet Container if its a web applications)

To run the jar file use the following command 

In this case define : "dev", "uat" and "prod"

1. Execute the following command

```bash
mvn package

or

mvn package -P<id_profile>
```

Execute

```bash
java -jar target/acme-greeting-api-restful-0.0.1-SNAPSHOT.jar
```

Use default environment -> dev or <id_profile> environment





## Use

Important : Beware of the configured port in the application-{id_profile}.yml


### Use Browser

The service will accept HTTP GET requests at :

```bash
http://localhost:8091/greeting
```

And return JSON

```bash
{"id":1,"content":"Hello, World!","responseTime":"???"}
```

The service will accept HTTP GET requests at :

```bash
http://localhost:8091/greeting?name=Acme
```

And return JSON

```bash
{"id":1,"content":"Hello, Acme!","responseTime":"???"}
```

### Use "curl"

Use the "curl"

```bash
curl -X GET http://localhost:8091/greeting

or

curl -X GET http://localhost:8091/greeting?name=Acme
```





## Use Actuators Endpoints

Important : Beware of the configured port

The actuators endpoints are configured in the application.yml
* Port : 8091
* Based-path : /manage

Example : http://localhost:8091/manage/info

The service will accept HTTP GET requests at :

```bash
http://localhost:8091/manage/<endpoint>
```











## Dockerize

A "Dockerfile" file will be designed to take care of :

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
docker build -t vjmadrid/demo-docker-nodejs-hello .
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





## Versioning

**Note :** [SemVer](http://semver.org/) is used for the versioning.
To see the available versions access the repository tags





## Authors

* **Víctor Madrid**
