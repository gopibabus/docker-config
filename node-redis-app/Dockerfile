# Use an existing docker image as a base
FROM node:alpine

# Configure working directory
WORKDIR /usr/node-redis-app

# Copy files from host OS into docker container
COPY ./package.json ./

# Download and install all dependencies
RUN npm install

# Copy files from host OS into docker container
COPY ./ ./

# Tell the image what to do when a container is created from it.
CMD ["npm", "start"]
