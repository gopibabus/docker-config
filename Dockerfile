# Use an existing docker image as a base
FROM alpine

# Download and install all dependencies
RUN apk add --update redis
RUN apk add --update gcc

# Tell the image what to do when it starts as container
CMD ["redis-server"]
