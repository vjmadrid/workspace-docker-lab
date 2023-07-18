# Hello World

Example mounting the classic "Hello World


- [Preparation](#preparation)
- [Execution](#execution)
- [Check](#check)





## <a name="installation">Preparation</a>

Execute previously the commands to verify that it does NOT exist in the system

```bash
docker --version

docker info
```





## <a name="execution">Execution</a>

Execute the following command

```bash
docker run hello-world
```

Notes :

* You should NOT have the image/container on the machine at first
* The first time you need it, it downloads automatically from the Internet -> Docker Registry ( Docker Hub )
* In later uses it will use it from its "local repo"





## <a name="check">Check</a>

Displays the "Hello World" message