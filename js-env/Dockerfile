# Note that the indy-sdk requires ubuntu 16 and some custom dependencies so we can't use node:carbon-apline like the others
FROM ubuntu:16.04

# This is the base of everything we will need for the image
RUN apt-get update && \
      apt-get install -y \
      software-properties-common \
      apt-transport-https \
      sudo \
      curl \
      build-essential \
      python2.7 \
      python-pip \
      git \
      vim \
      wget \
      iputils-ping \
      telnet

# Setup nodejs
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash && \
    apt-get install nodejs -y

# @todo maybe make 8080
# @todo need an easy way to switch between dev and prod, can use docker-compose
CMD [ "bash", "npm", "run", "start:debug" ]
