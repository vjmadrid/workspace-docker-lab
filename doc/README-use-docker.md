# Use Docker

## Verifying Installation

Command used to verify the installation

```bash
docker info
```

## Seeing containers

Command used to see our existing containers ("running")

```bash
docker ps
```

Command used to see all our existing containers ("starting" or "stopped")

```bash
docker ps -a
```

## Stopping containers

Command used to stop our existing containers ("running")

Note : require use the command "ps"

```bash
docker stop <container-id>
```

## Start containers

Command used to restart a container that has been stopped

Note : require use the command "ps"

```bash
docker start <container-id>
```

## Removing containers

Command used to removing or "uninstalling" containers -> NO delete the installer

Pre-Note : require use the command "ps -a"

```bash
docker rm <container-id>
```

Post-Note : require use the command "ps -a" for see it has been removed

## Removing images

Command used to removing images -> Delete the installer

Pre-Note : require use the command "images"

```bash
docker rmi <image-id>
```

## Searching images

Command used to search for a Docker image

```bash
docker search test
```

## Running an interactive application inside a container

Command used to search for a Docker image

```bash
docker search test
```

docker image prune or even docker image prune -a