#/bin/bash

docker pull tomcat:8.5-jdk8-corretto

Docker Tomcat

*. Version solicitada : 8.5.46


docker run -it --rm tomcat:8.5-jdk8-corretto

docker run -it --rm -p 8888:8080 tomcat:8.5-jdk8-corretto
