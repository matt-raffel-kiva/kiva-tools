# Note that the indy-sdk requires ubuntu 16 and some custom dependencies so we can't use node:carbon-apline like the others
FROM ubuntu:16.04

# This is the base of everything we will need for the image
RUN apt-get update && \
      apt-get install -y \
      software-properties-common \
      apt-transport-https \
      curl \
      build-essential \
      python2.7 \
      python-pip \
      git \
      vim


# Recommended way to get setup with libindy: https://github.com/hyperledger/indy-sdk#ubuntu-based-distributions-ubuntu-1604
ARG indy_stream=master
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 68DB5E88 && \
    add-apt-repository "deb https://repo.sovrin.org/sdk/deb xenial $indy_stream" && \
    apt-get update && \
    apt-get install -y libindy

# Setup nodejs
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash && \
    apt-get install nodejs -y


# setup rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH=~/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# setup for libindy compile
RUN apt-get update && \
    apt-get install -y \
        build-essential \
        pkg-config \
        cmake \
        libssl-dev \
        libsqlite3-dev \
        libzmq3-dev \
        libncursesw5-dev

RUN cd /tmp && \
      curl https://download.libsodium.org/libsodium/releases/old/libsodium-1.0.14.tar.gz | tar -xz && \
       cd /tmp/libsodium-1.0.14 && \
       ./configure --disable-shared && \
       make && \
       make install && \
       rm -rf /tmp/libsodium-1.0.14




# might want to setup a nodejs server at some point
# RUN mkdir www/
# WORKDIR www/
# ADD . .
# RUN npm install
# @todo maybe make 8080
# EXPOSE 3001
# @todo need an easy way to switch between dev and prod, can use docker-compose
CMD [ "bash", "npm", "run", "start:debug" ]
