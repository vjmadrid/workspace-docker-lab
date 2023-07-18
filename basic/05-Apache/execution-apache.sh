#/bin/bash

docker run -d -p 85:80 --name apache httpd

d: lanza el contenedor en modo dettached

Descarga una imagen si no existe localmente, lanza un contenedor y lo asocial al Puerto 82del host al Puerto 80 
El primer Puerto que aparece es el contenedor y el Segundo el host
Se puede usar el parámetro –name <nombre> para darle nombre al contenedor
Facilita la gestion al identificarlo de forma rápida
