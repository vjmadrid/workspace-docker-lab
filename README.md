# workspace-docker-lab

Este workspace es un repositorio de **proyectos y pruebas de concepto** con **Docker**

Docker es una herramienta que facilita la creación de entornos distribuibles, para ello se puede especificar un sistema operativo concreto, las librerías que utilizará, sus versiones específicas, las variables de entorno requeridas , etc.

Objetivos : 

* Permitir ejecutar una aplicación de forma aislada dentro de ese entorno creado
* Facilitar el "onboarding" : proporcionar el entorno de desarrollo cuando se incorpora un nuevo desarrollador al equipo al proporcionar un entorno con "todo montado"
* Disponer de diferentes entornos de desarrollo en "mi máquina" al trabajar de forma asilada porder cambiar un de plataforma , stack tecnologíco , etc se vuelve una tarea facil (se puede cambiar sin dejar muchos restos de otras instalaciones)
* Facilita la distribución así se consigue que una vez montada y cedida a otra persona, esta podrá utilizarlo en las mismas condiciones que cuando se genero
* Proprociona la capacidad de poder montar entornso de desarrollo más parecidos a los reales : DEV, UAT, QA, PRE , PRO , etc

Para ello crea "contenedores" en base a unas "imágenes" , estos contendores contiene todo lo necesario para funcionar y aunque cada uno tiene su propio consumo de los recursos HW lo interesante es su forma de compartir y hacer uso de los recursos en base a un sistema de archivos por capas -> por lo que consumen menos recursos que otros sistemas como puede ser una máquina virutal 


## Stack Tecnológico

* Windows 10
* Docker (https://www.docker.com/)
* Node 8.10

## Prerrequisitos

Se definen que elementos se necesitan para instalar el software

* Tener instalado Docker (Se requiere versión 18.09.2)

### Instalación

La instalación de Docker depende de la plataforma

## Testing

No aplica

## Despliegue

No aplica


## Versionado

**Nota :** Se utiliza [SemVer](http://semver.org/) para el versionado. 
Para ver las versiones disponibles acceder a los tags del repositorio

## Autores

* **Víctor Madrid**
