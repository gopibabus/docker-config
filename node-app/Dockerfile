# Use an existing docker image as a base
FROM node:alpine

# Configure working directory
WORKDIR /usr/node-app

# Copy files from host OS into docker container
COPY ./ ./

# Download and install all dependencies
RUN npm install

# Tell the image what to do when a container is created from it.
CMD ["npm", "start"]
