# Note that the indy-sdk requires ubuntu 16 and some custom dependencies so we can't use node:carbon-apline like the others
FROM ubuntu:16.04

# This is the base of everything we will need for the image
RUN apt-get update && \
      apt-get install -y \
      software-properties-common \
      apt-transport-https \
      build-essential \
      curl \
      git \
      iputils-ping \
      python2.7 \
      python-pip \
      sudo \
      telnet \
      vim \
      wget


# might want to setup a nodejs server at some point
# RUN mkdir www/
# WORKDIR www/
# ADD . .
# RUN npm install
# @todo maybe make 8080
# EXPOSE 3001
# @todo need an easy way to switch between dev and prod, can use docker-compose
CMD [ "bash", "npm", "run", "start:debug" ]
