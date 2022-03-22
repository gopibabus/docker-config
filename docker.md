# Docker

### How to check docker version installed on our machine?

```bash

docker version

```

### What is an image?

> Single file with all the dependencies and config required to run a program.

### What is a Container?

> Instance of an image runs a program.

### How to create and run a container from an image?

```bash

docker run <image name> <command>

# Example
docker run busybox echo hi there
docker run busybox ls
docker run busybox ping google.com

```

### How to list all containers?

```bash

# list all running containers
docker ps

# list all container that we ever created on our machine
docker ps --all

```

### How create and start a container?

```bash

# start a container
docker create hello-world # return container id

# run a container, -a will print output
docker start -a <container id>

```

### How stop a container?

```bash

docker stop <container id>

docker kill <container id>

```

### How to remove containers?

```bash

docker system prune

```

### How to retrieve logs from a container?

```bash

docker logs <container id>

```

### How to execute commands in running container?

```bash

# -it option allow us to input our data directly inside container and output data from container.
docker exec -it <container id> <command>

# Example
docker exec -it 7859545855855858 redis-cli

# Example: Access and use shell inside a container
docker exec -it 7859545855855858 sh
docker exec -it 7859545855855858 bash

```

### How to create and run a container with shell?

```bash

docker run -it busybox sh

```

### How to exit out of a container?

```bash

exit

```

### How to create our own image?

* Create a Dockefile
	* Specify base image
	* Run some commands to install programs
	* Specify a command to run a container startup.

```Dockerfile

# Use an existing docker image as a base
FROM alpine

# Download and install all dependencies
RUN apk add --update redis
RUN apk add --update gcc

# Tell the image what to do when it starts as container
CMD ["redis-server"]

```

### How to build and run a image?

```bash

# execute Dockerfile from current folder and it will output container id
docker build .

docker run <container id>

```

### How to build and tag/version a image?

```bash

docker build -t dockerId/projectName:version .

# Example
docker build -t gopibabus/redis:latest .

```

### How we can manually generate an image with docker commit?

> ❌ This process of creating images are not recommended.

```bash

docker run -it alpine sh
apk add --update redis

```

```bash

docker commit -c 'CMD["redis-server"]' <container id from above snippet>

```

### How can we implement port mapping?

```bash

docker run -p [host port]:[container port] image-name

# Example
docker run -p 8080:8080 gopibabus/simple-node-app

```

### Why we use docker-compose.yml file?

> In order to automate and organize docker CLI commands and options

```yml

version: "3"

services:
  redis-server:
    image: "redis"
  node-app:
    build: .
    ports:
      - "8080:8080"

```

### How to run image using docker-compose?

```bash

docker-compose up

```

### How to build & run image using docker-compose?

```bash

docker-compose up --build

```

### How to launch docker containers in background?

```bash

docker-compose up -d

```

### How to stop docker containers?

```bash

docker-compose down

```

### How to list all docker containers in docker-compose file?

> Make sure to run this command from directory containing docker-compose.yml file.

```bash

docker-compose ps

```

### How can application code comminicate with different services running in different containers?

> Just refer service name from docker-compose file in place of host name.

### What are restart policies in Docker?

1. "no": Never attempt to restart the container if it stops or crashes.
2. always: If the container stops for any reason always attempt to restart it.
3. on-failure: Only restart if the container stops with an error code.
4. unless-stopped: Always restart unless we forcibly stop it.

### How to apply restart policy to containers?

```yml

version: "3"

services:
  redis-server:
    image: "redis"
  node-app:
    restart: always
    build: .
    ports:
      - "8080:8080"

```

### How to build image and start container using custom Dockerfile?

```bash

docker build -f <path to docker file> <path to location to build>

docker run -p hostPort:guestPort <container id>

# Example
docker build -f Dockerfile.dev .
docker run <container id returned by above build>
docker run -p 3000:3000 <container id returned by above build>

```

### How to create Docker volume?

```bash

# first -v flag instructs not to touch node_modules folder inside container
$ second -v flag instr
docker run -p 3000:3000 -v /app/node_modules -v $(pwd):/app <container id returned by above build>

```

### How to attach a command to a docker container?

```bash

docker attach <container id> <commands>

# Example
docker attach <container id> npm run test
```

### How to tag an docker image?

```bash

docker build -t gopibabus/simple-react-app -f Dockerfile.dev .

```
