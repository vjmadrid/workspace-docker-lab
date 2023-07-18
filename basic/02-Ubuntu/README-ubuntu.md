# Ubuntu

Example showing how to use an operating system image and its implications (updates, installations, etc.)


- [Preparation](#preparation)
- [Execution](#execution)
- [Check](#check)





## <a name="installation">Preparation</a>

Execute previously the commands to verify that it does NOT exist in the system

```bash
# Images
docker images ps

# Containers
docker ps 
```





## <a name="execution">Execution</a>

Execute the following command

```bash
docker run –it ubuntu /bin/bash
```

Execute the following command for update packages

```bash
apt-get update
```

Execute the following command for install package "figlet"

```bash
apt-get install figlet
```

Execute the following command for check "figlet"

```bash
figlet "Hello Docker World"
```

Docker ps –a | head

Docker  commit <ID_CONTAINER>

Se crea sin nombre y tag

Docker image tag <ID> midocker:1.0

Docker run micodcker figlet hola ya tiene ese comando instalado

Probar sobre la imagen original y ese comando fallara
Solo funcionara en la que tiene figlet

Meterte en el contenedor quedaa como sucio 










## <a name="check">Check</a>

Displays the "Hello World" message