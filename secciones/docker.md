# Docker

- [Basics](#Basics)
- [Dockerfile](#Dockerfile)
- [Networking](#Networking)

## Basics

- [Docker](https://docs.docker.com/engine/installation/)
- [nvidia-docker](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker)

docker build --tag bulletinboard:1.0 .

docker run --publish 8000:8080 --detach --name bb bulletinboard:1.0

Iniciar un contenedor detenido:

`docker container start 0fd2e1d25d57`

ingresar en el contenedor:

`docker exec -it 0fd2e1d25d57 bash`

## Dockerfile

Docker can build images automatically by reading the instructions from a Dockerfile. A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image. Using docker build users can create an automated build that executes several command-line instructions in succession.

The docker build command builds an image from a Dockerfile and a context. The build’s context is the set of files at a specified location PATH or URL. The PATH is a directory on your local filesystem. The URL is a Git repository location.

A context is processed recursively. So, a PATH includes any subdirectories and the URL includes the repository and its submodules. This example shows a build command that uses the current directory as context:

`$ docker build .`

Sending build context to Docker daemon  6.51 MB
...

The build is run by the Docker daemon, not by the CLI. The first thing a build process does is send the entire context (recursively) to the daemon. In most cases, it’s best to start with an empty directory as context and keep your Dockerfile in that directory. Add only the files needed for building the Dockerfile.

## Networking

[network docs](https://docs.docker.com/network/)

List networks
`docker network ls`

## Volumes

[volumes docs](https://docs.docker.com/storage/volumes/)


