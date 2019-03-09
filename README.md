# workspace-docker-lab

This workspace is a repostory about **projects and PoCs** with **Docker**

Docker es una herramienta que facilita la creación de entornos distribuibles, para ello se puede especificar un sistema operativo concreto, las librerías que utilizará, sus versiones específicas, las variables de entorno requeridas , etc.

Docker is a tool that facilitates the creation of distributable environments. To do this, you can specify a type operating system, the libraries you will use, their specific versions, the required environment variables, etc.

Objectives  : 

* Allow to execute an application of isolated form inside that created environment
* Facilitate onboarding: provide the development environment when a new developer joins the team by providing an "all-in-one" environment.
* To have different environments of development in "my machine" when working in an isolated way by changing a platform, technological stack, etc becomes an easy task (it can be changed without leaving many traces of other installations).
* Facilitates distribution so that once assembled and transferred to another person, this person can use it in the same conditions as when it was generated.
* Provides the ability to mount development environments more similar to the real : DEV, UAT, QA, PRE , PRO , etc.

> Operation
>
>To do this, Docker creates "containers" based on "images". 
>These containers contain everything necessary to operate and although each has its own consumption of HW resources the interesting thing is their way of sharing and making use of resources based on a layered file system -> so they consume less resources than other systems such as a virutal machine. 


## Technological Stack

* Windows 10
* Docker (https://www.docker.com/)
* Node 8.10

## Prerequisites

Define what elements are needed to install the software

* Docker installed (Version 18.09.2 required)

### Installation

The installation of Docker depends on the platform

## Testing

N/A

## Deploy

N/A

## Problemas

Help for problems section

### Problema con el daemon que falla en algunas ocasiones en Windows

It is advisable to execute a terminal in administrator mode execute the following commands

```bash
Net stop com.docker.service
Net start com.docker.service
```

Another option is to do it from the windows services option by restarting the service named : Docker for Windows Service

## versioning

**Note :** [SemVer](http://semver.org/) is used for the versioning. 
To see the available versions access the repository tags

## Authors

* **Víctor Madrid**
