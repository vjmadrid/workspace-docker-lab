# demo-docker-with-volume-nodejs-hello

Project that show a message "Hello World" ("All a classic of any development" :-) ) along with information of the event that triggered it through a request REST (HTTP event) but all mounted inside a docker image

Using Volume or data volume -> create a place in the host machine where we can tu persist files
2 actions: 

* before the creation of the container
* While creating the container

```bash
# Create Volume
docker volume create <volume_name>

# Volume List
docker volume ls

# Delete all volumes are not using
docker volume prune

# Delete Volume
docker volume rm <volume_name>

# Delete Volume
docker inspect  <volume_name>
```

Use with "docker run"

```bash
# *** Option 1 ***
# Use -v or --volume
docker run XXXX --name <container_name> --volume <volume_name>:<container_directory>

# *** Option 2 ***ç
# Use -mount
docker run XXXX --name <container_name> -mount=<volume_name>,target=<container_directory>
```

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

1. Creating a directory for the project : **demo-docker-with-volume-nodejs-hello**
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

Similary to the demo : **demo-docker-node-hello** 

### Creating a "Dockerfile" file

Similary to the demo : **demo-docker-node-hello** 

### Construction of the image based on the "Dockerfile" file

Similary to the demo : **demo-docker-node-hello** 

### Start the container based on image

Execute the following command on the previously created image 

```bash
docker run -d -p 8000:3000 --name demo-docker-with-volume-nodejs-hello --volume demo-docker-with-volume-nodejs-hello-volume:/logs vjmadrid/node
```

In this case the parameter **"-p 8000:3000"** has been added to map port 8000 with 3000

Note : You can run in the background by adding the parameter **"-d "** (Daemon Mode) -> The output of the execution will not be visible.

Define a particular name with **--name**

And define a volume with **--volume**


Verify the volume in the container

```bash
docker exec -it demo-docker-with-volume-nodejs-hello bash
```

### Mount a subdirectory project volume

```bash
docker run -d -p 8000:3000 --name demo-docker-with-volume-nodejs-hello --volume ${pwd}/logs:/logs vjmadrid/node
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
