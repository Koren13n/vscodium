FROM ubuntu:20.04

ENV DEBIAN_FRONTEND='noninteractive'

RUN apt-get update && apt-get install -y --no-install-recommends\
    git \
    npm \
    jq \
    curl \
    pkg-config \
    g++ gcc make python2.7 pkg-config libx11-dev libxkbfile-dev libsecret-1-dev \
    python3-pip \
    rpm \
    wget \
    imagemagick \
    python-is-python3 \
&& rm -rf /var/lib/apt/lists/* 

RUN npm install -g yarn

RUN pip install setuptools
RUN pip install git+https://chromium.googlesource.com/external/gyp

WORKDIR /app-build

COPY . /app-build
