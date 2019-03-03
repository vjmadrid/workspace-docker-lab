# demo-docker-nodejs-hello
Proyecto que Muestra un mensaje "Hello World" ("Todo un clásico de cualquier desarrollo" :-) ) junto a información del evento que lo desencadeno a través de una petición REST (evento HTTP) pero todo ello montado dentro de una imagen docker

## Stack Tecnológico

* Node.js (https://nodejs.org)
* Docker (https://www.docker.com/)

## Prerrequisitos

Instalar las siguientes herramientas y frameworks:
* Node.js 8.10 o superior
* Editor de código
* Postman

Recomendación de elementos extra a instalar :
* Visual Studio Code: https://code.visualstudio.com/
* nvm: https://github.com/creationix/nvm
* npm: https://www.npmjs.com/ (ver. 6.5.0)

## Instalación

Generales

* Instalar y Configurar Node.js (Documento **workspace-nodejs-lab/doc/README-instalacion-configuracion-node.md**)
* Instalar y Configurar NVM (Documento **workspace-nodejs-lab/doc/README-instalacion-configuracion-nvm.md**)

Específicos

* Preparar y Configurar un proyecto genérica (Documento **workspace-nodejs-lab/doc/README-preparar-configurar-proyecto.md**)

Este proyecto sigue los pasos básicos de construcción

1. Creación de un directorio para el proyecto : **demo-docker-nodejs-hello**
2. Ubicarse dentro de este directorio
3. Ejecutar el comando de creación de un arquetipo básico 

```bash
npm init -y
```

4. Verificar la existencia del fichero package.json

NOTA : No aplicar más pasos del documento

## Preparación del proyecto 

### Instalación de las dependencias del proyecto 

* **[express](https://www.npmjs.com/package/express)** : Framework para aplicaciones web en node

Ejecutar el siguiente comando

```bash
npm install express --save
```

Instalará la última versión del framework express

Verificar que aparece en el fichero package.json


### Creación de un fichero de aplicación

Se crea un fichero de aplicación en el directorio de proyecto con el nombre : **app.js**

Por ejemplo : 
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

Probamos la aplicación ejecutando el siguiente comando

```bash
node app.js
```

Se puede verificar que todo hay ido bien mediante el log que mostrará el siguiente mensaje : **[APP EXPRESS] hello app listening on port 3000!**

Ejecutamos a traves del navegador o bien Postman : **http://localhost:3000/hello**

Se debería de mostrar el mensaje con la hora de la ejecución y en el log el mensaje : **info [APP EXPRESS] hello...**

### Creación de un fichero "Dockerfile"

Se va a diseñar un fichero que se encargue de :

* Copiar los ficheros del ejemplo al contenedor de docker
* Instalar las dependencias del proyecto
* Abrir un puerto para que sea accesible
* Arrancar la aplicación

Ejemplo del fichero "Dockerfile" : 

```bash
FROM node:latest

WORKDIR /demo-docker-nodejs-hello

COPY . /demo-docker-nodejs-hello

ENV PORT=3000

RUN npm install

EXPOSE $PORT

ENTRYPOINT ["node", "app.js"]
```

Explicación : 
* **FROM node:latest** : Selecciona la última imagen de "Docker Hub" basada en Ubuntu y que tiene Nodejs instalada
* **WORKDIR /demo-docker-nodejs-hello** : Situa el directorio de proyecto
* **COPY . /demo-docker-nodejs-hello** : Copia la ruta actual en otro
* **ENV PORT=3000** : Establece la variable de entorno PORT con el valor 3000
* **RUN npm install** : Ejecución de la instalación de las dependencias del proyecto
* **EXPOSE $PORT** : Abre el puerto 3000 para que sea accesible desde fuera
* **ENTRYPOINT ["node", "app.js"]** : Indicación de como arrancar la aplicación

### Construcción de la imagen en base al fichero "Dockerfile"

Nos ubicamos dentro del directorio de proyecto y ejecutamos el siguiente comando

```bash
docker build -t vjmadrid/node:latest .
```

En mi caso ehe puesto "vjmadrid" pero se podría poner otro elemento, esto ayudará a localizar la imagen despues

A partir de este momento se encargará de descargar todo lo necesario así como hacer las operativas indicadas en el fichero

Revisamos si se encuentra disponible la imagen con el siguiente comando

```bash
docker images
```

Debería aparecer nuestra imagen con ciertos valores asignados : image_id, fecha de creación, tamaño, respositorio y tag


### Arrancar en contenedor en base a la imagen

Para ello ejecutamos el siguiente comando sobre la imagen creada anteriormente 

```bash
docker run -p 8000:3000 vjmadrid/node
```

En este caso se ha añadido el parámetro **"-p 8000:3000"** para mapear el puerto 8000 con el 3000

Nota : Se puede ejecuar en segundo plano añadiendo el parámetro **"-d"** (Modo Daemon) -> La salida de la ejecución no será visible

Para verificar si el contenedor se encuentra arrancado ejecutaremos en siguiente comando

```bash
docker ps
```

Se puede verificar que todo hay ido bien mediante el log que mostrará el siguiente mensaje : **[APP EXPRESS] hello app listening on port 3000!**

Ejecutamos a traves del navegador o bien Postman : **http://localhost:8000/hello**

Se debería de mostrar el mensaje con la hora de la ejecución y en el log el mensaje : **info [APP EXPRESS] hello...**



### Parar en contenedor 

Para verificar si el contenedor se encuentra arrancado ejecutaremos en siguiente comando

```bash
docker ps
```

Si lo vemos en la lista pasaremos a ejecutar el siguiente comando 

```bash
docker stop <container_id>
```

Este comando envia una señal SIGTERM junto a la señal SIGKILL despues de un periodo de tiempo considerado -> Liberar recursos y guardar el estado

Se puede usar el comando kill que envia una señal SIGKILL lo que implica que quizas no se haga bien la liberación de recursos y lo de almacenar el estado,
no se aconseja su uso en producción


### Aplicación del modo interactivo

Facilita poder entrar dentro de un contenedor en ejecución

```bash
docker ps
```

Si lo vemos en la lista pasaremos a ejecutar el siguiente comando 

```bash
docker exec -it <container_id> <shell>

#Ejemplo
docker exec -it 40f bash
```

Se puede ejecutar cualquier cosa dentro del contenedor

```bash
docker exec <container_id> node app.js
```

### Eliminar en contenedor 

Para verificar si se encuentra la imagen

```bash
docker images
```

Si lo vemos en la lista pasaremos a ejecutar el siguiente comando 

```bash
docker rm <container_id>
```


## Testing

Cada proyecto tiene su forma

## Despliegue

No aplica


## Versionado

**Nota :** Se utiliza [SemVer](http://semver.org/) para el versionado. 
Para ver las versiones disponibles acceder a los tags del repositorio

## Autores

* **Víctor Madrid**
