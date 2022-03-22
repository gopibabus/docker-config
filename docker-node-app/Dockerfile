# Use an existing docker image as a base
FROM node:alpine

# Copying build files
WORKDIR /usr/app
COPY ./package.json /usr/app
# Download and install all dependencies in work directory
RUN npm install
COPY ./ /usr/app

# Tell the image what to do when it starts as container
CMD ["npm", "start"]
